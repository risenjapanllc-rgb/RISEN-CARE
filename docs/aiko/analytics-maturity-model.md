# AIKO Analytics Maturity Model (AMM)

## 1. 目的

AIKOは単なる検索システムではない。

介護・福祉現場のデータを活用し、検索から分析、さらに事前対応支援まで段階的に発展する分析AIを目指す。

本ドキュメントでは、AIKOの分析能力を5段階の成熟度モデル（Analytics Maturity Model : AMM）として定義する。

このモデルは、

- 開発ロードマップ
- 顧客への説明
- 分析機能の優先順位
- RISEN標準データモデルの設計

を共通の視点で整理するために利用する。

---

# 2. Analytics Maturity Model

```
Level 5
Preventive Intelligence
事前対応支援
────────────────────────

Level 4
Pattern Discovery
パターン分析
────────────────────────

Level 3
Comparison & Trend
比較・傾向分析
────────────────────────

Level 2
Summary & Aggregation
要約・集計
────────────────────────

Level 1
Search
検索
```

AIKOは各レベルを積み重ねながら進化する。

上位レベルは下位レベルの能力を利用する。

---

# Level 1：Search（検索）

## 目的

必要な記録を迅速に検索する。

## 主な機能

- 利用者検索
- 記録検索
- Observation検索
- キーワード検索
- 日付検索

## 質問例

- 昨日の記録を教えて
- 最新の支援記録を表示
- 転倒記録を検索
- 食事記録を表示

## 利用技術

- Query Intent
- Retrieval Engine
- RISEN標準データ検索

---

# Level 2：Summary & Aggregation（要約・集計）

## 目的

複数の記録を整理し、集計・要約する。

## 主な機能

- 要約
- 平均
- 合計
- 件数
- 回数
- 最大
- 最小
- 中央値

## 質問例

- 平均睡眠時間は？
- 今月の途中覚醒回数は？
- 食事量の平均は？
- 排便回数を教えて

## 利用技術

- Aggregation Engine
- Evidence Builder
- LLMによる説明

---

# Level 3：Comparison & Trend（比較・傾向分析）

## 目的

複数の期間や条件を比較し、変化や傾向を把握する。

## 主な機能

- 期間比較
- 条件比較
- 時系列分析
- 増減分析
- 傾向把握

## 質問例

- 先月と今月を比較
- 最近睡眠時間は減っている？
- 食事量は改善している？
- 血圧の推移は？

## 利用技術

- Comparison Engine
- Trend Analysis
- 時系列分析

---

# Level 4：Pattern Discovery（パターン分析）

## 目的

複数の記録から共通する特徴や繰り返し現れるパターンを発見する。

## 主な機能

- 共通点抽出
- 特徴抽出
- イベント前分析
- イベント後分析
- 条件別分析

## 質問例

- 興奮がなかった日の共通点は？
- 興奮前に共通する出来事は？
- 転倒前の特徴は？
- 夜間覚醒が多い日の傾向は？

## 利用技術

- Pattern Analysis Engine
- Episode Engine
- Observation Sequence
- Trigger Analysis

---

# Level 5：Preventive Intelligence（事前対応支援）

## 目的

分析結果をもとに、職員が事前対応を検討できる情報を提供する。

AIKOは支援を行うが、介護方法を決定しない。

## 主な機能

- 事前確認項目の提示
- 注意点の提示
- リスク候補の提示
- 支援候補の提示

## 質問例

- 今日注意した方がよいことは？
- 興奮予防のため確認する項目は？
- 転倒予防につながる観察ポイントは？

## 利用技術

- Analytics Engine
- Evidence Engine
- Explainable AI

---

# 3. MVP開発対象

AIKO MVPでは以下のユースケースを実装する。

| ユースケース | レベル |
|--------------|---------|
| 平均睡眠時間 | Level 2 |
| 興奮がなかった日の共通点 | Level 4 |
| 興奮前の共通パターン | Level 4 |

これら3つを通じて、

- Query Intent
- Analytics Engine
- Evidence Model
- AI回答

までの一連の処理を完成させる。

---

# 4. RISEN CAREとの関係

AIKOはRISEN CAREが生成するObservation Intelligenceを活用する分析AIである。

役割は以下のように分かれる。

| RISEN CARE | AIKO |
|-------------|------|
| Observation収集 | 質問受付 |
| 標準データ生成 | Intent解析 |
| Knowledge Graph | Analytics実行 |
| Observation Intelligence | Evidence生成 |
| Trigger Analysis | AI回答 |
| Explainable AI基盤 | 自然言語で説明 |

---

# 5. 開発方針

AIKOは以下の順序で開発を進める。

```
Level 1
検索

↓

Level 2
集計・要約

↓

Level 3
比較・傾向分析

↓

Level 4
パターン分析

↓

Level 5
事前対応支援
```

各レベルは前段階の機能を基盤として構築する。

---

# 6. 基本原則

AIKOは成熟度が高くなっても、以下の原則を維持する。

- RISEN標準データを根拠とする。
- 推測を事実として回答しない。
- 回答より先にEvidenceを生成する。
- AIは分析結果を説明する。
- 最終判断は職員が行う。
- すべての回答は後から検証できる。

---

# 7. 将来の発展

将来的には、Analytics Maturity Modelをさらに拡張し、以下の機能を追加する予定である。

## Level 6（構想）

### Organizational Intelligence

- 施設全体分析
- ユニット比較
- 職員支援
- 業務改善分析
- 経営分析

## Level 7（構想）

### Collective Intelligence

- 複数施設比較
- ベストプラクティス共有
- 地域分析
- ナレッジ共有
- 継続的な知識進化

これらはRISEN CAREプラットフォーム全体の発展に合わせて段階的に実装する。
