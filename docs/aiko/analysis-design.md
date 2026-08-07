# AIKO Analysis Engine Design

## 1. 目的

AIKOは検索システムではない。

RISEN標準データを利用して、

* 検索
* 要約
* 集計
* 比較
* 傾向分析
* パターン分析
* 事前対応支援

を行い、利用者支援や業務改善に役立つExplainable Answerを生成する。

AIKOの分析は、LLM単独で行わない。

構造化されたデータ、Analytics Engine、Evidenceを組み合わせて実行する。

---

# 2. 基本アーキテクチャ

```text
User Question

↓

Query Intent

↓

Analysis Request

↓

Data Resolver

↓

RISEN Standard Data

↓

Fact Extraction

↓

Context Construction

↓

Derived Observation

↓

Analytics Engine

↓

Evidence Builder

↓

LLM Answer Generator

↓

Explainable Answer
```

---

# 3. 基本原則

AIKOの分析は以下の原則を守る。

* ObservationをSource of Truthとする。
* FactとDerived Observationを区別する。
* AnalyticsをLLMより先に実行する。
* Evidenceを回答より先に生成する。
* 推定は許可するが、推定であることを明示する。
* 相関を因果として断定しない。
* 十分なEvidenceがない場合はUnknownを返す。
* 最終判断は職員が行う。

---

# 4. Query Processing

AIKOへの質問は自然言語で入力される。

質問文の表現は無数に存在するため、質問をそのまま分析ロジックに結びつけない。

まずQuery Intentへ変換する。

例：

```text
質問

「この1ヶ月の平均睡眠時間は？」
```

変換：

```text
Intent:
Aggregation

Target:
Sleep

Metric:
Average Duration

Period:
30 Days
```

---

# 5. 分析タイプ

AIKOでは以下の分析タイプを定義する。

## 1. Search

記録を検索する。

例：

* 昨日の記録
* 最新の支援記録

---

## 2. Summary

複数の記録を整理・要約する。

例：

* 最近の様子
* 今週のまとめ

---

## 3. Aggregation

数値を集計する。

例：

* 平均睡眠時間
* 途中覚醒回数
* 排便回数
* 平均食事量

---

## 4. Comparison

複数条件を比較する。

例：

* 先月と今月
* 興奮ありの日となしの日
* 日中と夜間

---

## 5. Trend Analysis

時間変化を分析する。

例：

* 最近睡眠時間は減っているか
* 食事量は変化しているか

---

## 6. Pattern Analysis

複数のObservationから共通パターンを抽出する。

例：

* 興奮前の共通点
* 転倒前の特徴
* 夜間覚醒が多い日の傾向

---

## 7. Recommendation Support

分析結果から事前確認や支援検討に役立つ情報を提示する。

例：

* 興奮前に確認するとよい項目
* 転倒予防につながる観察項目

AIKOは最終判断を行わない。

---

# 6. Fact and Context Derivation

AIKOは、RISEN標準データに記録されたObservationをそのままLLMへ渡して判断させない。

まずFactとContextを整理する。

基本フローは以下とする。

```text
Observation

↓

Fact
記録から直接確認できる事実

↓

Context
時系列・前後関係・複数Observation

↓

Derived Observation
文脈から合理的に導出された状態・イベント

↓

Pattern
複数事象から確認される共通構造

↓

Evidence
分析結果を支える根拠

↓

Answer
```

---

# 7. Fact

Factは、記録から直接確認できる内容である。

例：

```text
22:00 入眠
01:30 大声
06:30 起床
```

Fact：

```text
sleep_start = 22:00
loud_voice = 01:30
wake_up = 06:30
```

Factには元Observation IDを保持する。

---

# 8. Context

Contextは、複数のFactの時系列や前後関係から構成する。

例：

```text
22:00 入眠

↓

01:30 大声

↓

06:30 起床
```

この場合、

```text
01:30の大声は

入眠後
かつ
起床前
```

というContextが成立する。

---

# 9. Derived Observation

Derived Observationは、記録に直接明示されてはいないが、FactとContextから合理的に導出できる状態・イベントである。

例：

```text
22:00 入眠
01:30 大声
06:30 起床
```

Derived Observation：

```text
type:
probable_awakening

occurred_at:
01:30

confidence:
medium / high

sources:
sleep_start
loud_voice
wake_up
```

回答では、

> 入眠後から起床前に大声の記録があるため、途中覚醒があった可能性が推定されます。

と表現する。

Derived ObservationをFactとして扱ってはならない。

---

# 10. Fact / Derived / Unknown

AIKOでは分析結果を可能な限り以下の3状態で管理する。

```text
FACT

DERIVED

UNKNOWN
```

## FACT

記録から直接確認できる。

## DERIVED

FactとContextから合理的に導出できる。

## UNKNOWN

十分なEvidenceがなく判断できない。

この分類はEvidence BuilderとAnswer Generatorまで保持する。

---

# 11. Derived Observationの信頼度

必要に応じてDerived Observationには信頼度を付与する。

例：

```text
very_high
high
medium
low
```

例：

```text
明示的に「覚醒」「起床」
→ FACT

睡眠時間中の離床・会話
→ DERIVED / high

睡眠時間中の大声
→ DERIVED / medium-high

睡眠時間中の寝言
→ DERIVED / low
```

低信頼度のDerived Observationは、集計対象から除外する、または参考情報として扱うことができる。

---

# 12. Analytics Engine

Analytics Engineは、Factおよび許可されたDerived Observationを用いて分析を行う。

基本構成：

```text
analytics/

├── sleep/
├── comparison/
├── pattern/
├── trend/
├── derivation/
└── common/
```

---

# 13. Sleep Analysis

睡眠分析では以下を扱う。

## Fact

* 就寝
* 入眠
* 起床
* 明示的途中覚醒

## Derived

* 睡眠中の離床
* 睡眠中の呼びかけ
* 睡眠中の大声
* 睡眠中の会話

などから推定される途中覚醒候補。

---

# 14. Sleep Episode

睡眠記録は日単位ではなく、可能な限りSleep Episodeとして構成する。

例：

```text
Sleep Episode

start:
22:00

derived_awakening:
01:30

resume:
01:40

end:
06:30
```

ここから、

* 睡眠時間
* 途中覚醒回数
* 覚醒時間
* 有効睡眠日数

などを算出する。

---

# 15. Comparison Analysis

比較分析では、Observationを直接比較するのではなく、分析単位へ変換する。

例：

```text
ResidentDay

resident_id
date

sleep_minutes
awakening_count
meal_rate
bowel_count
activity_count
agitation_count
```

これにより、

```text
興奮ありの日

VS

興奮なしの日
```

を比較できる。

---

# 16. Pattern Analysis

Pattern Analysisでは、対象イベントを基準点として前後のObservationを分析する。

例：

```text
Agitation Event

↓

-1 hour
-3 hours
-6 hours
-12 hours
-24 hours
```

複数イベントについて同様に分析し、共通特徴を抽出する。

例：

```text
興奮10回

睡眠6時間未満
8回

排便2日以上なし
7回

17〜19時発生
6回
```

---

# 17. Patternと原因の区別

Patternは原因を意味しない。

例：

```text
睡眠不足と興奮が同時に多く確認された
```

ことから、

```text
睡眠不足が興奮の原因
```

と断定してはならない。

回答では、

* 「関連が見られます」
* 「傾向があります」
* 「共通して確認されています」

などを使用する。

---

# 18. Evidence Builder

すべての分析結果はEvidence Builderへ渡す。

Evidenceには以下を含む。

* 元Observation
* Observation ID
* Fact
* Derived Observation
* 分析条件
* 対象期間
* 対象件数
* 集計結果
* 比較結果
* Pattern

---

# 19. Evidence First Flow

AIKOでは以下の順序を守る。

```text
Question

↓

Retrieval

↓

Fact

↓

Context

↓

Derived Observation

↓

Analytics

↓

Evidence

↓

Answer
```

Evidenceより先に回答を生成しない。

---

# 20. Answer Generation

LLMへ渡す情報は以下とする。

```text
User Question

+

Query Intent

+

Analysis Result

+

Evidence

+

Fact / Derived / Unknown

+

Answer Policy
```

LLMの役割は、分析結果を自然な文章へ変換することである。

---

# 21. LLMの役割

LLMが担当する。

* 質問の自然言語理解
* Intent候補生成
* Evidenceの要約
* 分析結果の説明
* 自然な回答生成

LLMが担当しない。

* 平均値計算
* 件数集計
* 比較値計算
* Evidenceの捏造
* 根拠のない原因推定
* Factの生成

---

# 22. Data Insufficient

分析に必要なデータが不足している場合も、正常な分析結果として扱う。

例：

```text
status:
insufficient_data

missing:
sleep_start
sleep_end

available:
sleep_related_observations = 20
```

Answer Generator：

> 睡眠関連の記録は20件確認されていますが、睡眠開始時刻と起床時刻が十分に記録されていないため、平均睡眠時間は算出できません。

---

# 23. MVPユースケース

初期MVPでは以下の3つを実装する。

## UC-001

1ヶ月の平均睡眠時間・途中覚醒回数

分析タイプ：

Aggregation

---

## UC-002

興奮がなかった日の共通点

分析タイプ：

Comparison / Pattern Analysis

---

## UC-003

興奮前の共通パターン

分析タイプ：

Pattern Analysis

---

# 24. MVP開発順

```text
UC-001

↓

UC-002

↓

UC-003

↓

共通処理をAnalytics Engineへ整理
```

最初から巨大な汎用Analytics Engineを作らない。

3ユースケースを実際に動かし、その共通部分を抽象化する。

---

# 25. Definition of Done

各MVPユースケースは以下がすべて動作した時点で完成とする。

```text
自然言語で質問

↓

Intent判定

↓

必要データ取得

↓

Fact抽出

↓

Context構築

↓

Derived Observation生成

↓

Analytics実行

↓

Evidence生成

↓

LLM説明

↓

元Observation確認
```

---

# 26. 基本思想

AIKOは、記録に書いてある単語だけを検索するシステムではない。

Observationの前後関係を読み、文脈を理解し、必要に応じてDerived Observationを生成する。

ただし、その導出結果はFactと明確に区別する。

> **AIKO derives understanding from facts and context.**

> **It never presents derived observations as facts.**

これがAIKO Analysis Engineの基本設計原則である。
