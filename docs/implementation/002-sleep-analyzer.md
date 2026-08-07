# AIKO Sleep Analyzer Implementation

## 1. 目的

Sleep Analyzerは、RISEN標準データから睡眠に関するFactおよびDerived Observationを生成し、以下の分析を可能にする。

* 平均睡眠時間
* 睡眠時間の最短・最長
* 有効睡眠日数
* 明示的な途中覚醒回数
* 文脈から推定される途中覚醒回数
* 睡眠傾向

Sleep Analyzerは、AIKO MVPのUC-001を実現する中核モジュールである。

---

# 2. 対象ユースケース

## UC-001

質問例：

* この1ヶ月の平均睡眠時間は？
* 最近どれくらい寝ていますか？
* 夜中に何回起きていますか？
* 途中覚醒は多いですか？

分析タイプ：

```text
Aggregation
+
Derived Observation
```

---

# 3. 基本フロー

```text
Question

↓

Query Intent

↓

Sleep Data Retrieval

↓

Fact Extraction

↓

Sleep Episode Construction

↓

Context Analysis

↓

Derived Awakening Detection

↓

Sleep Analytics

↓

Evidence Builder

↓

LLM Answer Generator
```

---

# 4. 必要データ

Sleep AnalyzerはRISEN標準データのみを利用する。

最低限必要な項目：

```text
resident_id

observation_id

event_type

event_category

observed_at

event_start_at

event_end_at

text

source_type
```

可能であれば以下も利用する。

```text
sleep_start_at

sleep_end_at

awakening_at

sleep_resume_at

severity

location

staff_id
```

---

# 5. Fact Extraction

Sleep AnalyzerはObservationから睡眠関連Factを抽出する。

代表的なFact：

```text
sleep_start
sleep_confirmed
wake_up
explicit_awakening
leave_bed
toilet
loud_voice
calling_staff
conversation
movement
sleep_resume
```

Factには必ず元Observation IDを保持する。

例：

```json
{
  "type": "loud_voice",
  "occurred_at": "2026-07-25T22:52:00+09:00",
  "resident_id": "resident_001",
  "observation_id": "obs_123"
}
```

---

# 6. Sleep Episode

睡眠分析は、Observation単位ではなくSleep Episode単位で行う。

例：

```text
2026-07-25

22:00 入眠

↓

22:52 大声

↓

23:10 再入眠

↓

06:20 起床
```

Sleep Episode：

```json
{
  "start_at": "2026-07-25T22:00:00+09:00",
  "end_at": "2026-07-26T06:20:00+09:00",
  "resident_id": "resident_001"
}
```

---

# 7. Sleep Episodeの開始条件

以下をSleep Episode開始候補とする。

優先順位：

```text
1. 明示的な入眠
2. 就寝
3. 睡眠確認
4. ベッド上で睡眠中
```

開始時刻が曖昧な場合はFactとして確定せず、推定値として扱う。

---

# 8. Sleep Episodeの終了条件

以下を終了候補とする。

優先順位：

```text
1. 明示的な起床
2. 離床
3. 朝の活動開始
4. 朝食
```

ただし、単発の夜間離床はSleep Episode終了ではなく途中覚醒として扱う可能性がある。

---

# 9. 途中覚醒

途中覚醒は2種類に分類する。

## Explicit Awakening

記録に直接、

```text
覚醒
起きる
途中覚醒
夜間覚醒
```

などが明示されているもの。

状態：

```text
FACT
```

---

## Derived Awakening

途中覚醒とは明記されていないが、睡眠中の行動から覚醒状態が合理的に推定されるもの。

状態：

```text
DERIVED
```

---

# 10. Derived Awakening候補

Sleep Episode開始後かつ終了前に、以下のイベントが発生した場合は途中覚醒候補とする。

```text
leave_bed
toilet
conversation
calling_staff
nurse_call
loud_voice
walking
room_exit
```

例：

```text
22:00 入眠

01:30 「看護婦さん」と呼ぶ

06:30 起床
```

この場合、

```text
01:30
probable_awakening
DERIVED
```

とする。

---

# 11. 信頼度

Derived Awakeningには信頼度を持たせる。

```text
very_high
high
medium
low
```

例：

| イベント   | 信頼度         |
| ------ | ----------- |
| 明示的覚醒  | FACT        |
| 夜間離床   | high        |
| トイレ    | high        |
| 職員との会話 | high        |
| ナースコール | high        |
| 大声     | medium-high |
| 呼びかけ   | medium-high |
| 寝言     | low         |

---

# 12. 信頼度の利用

集計時には閾値を設定できるようにする。

例：

```text
strict

FACTのみ
```

```text
standard

FACT
+
DERIVED high以上
```

```text
extended

FACT
+
DERIVED medium以上
```

初期MVPでは、

```text
standard
```

を推奨する。

---

# 13. 平均睡眠時間

平均睡眠時間は有効なSleep Episodeのみを対象とする。

有効条件：

```text
start_atが存在

AND

end_atが存在

AND

end_at > start_at
```

算出：

```text
sleep_duration =
end_at
-
start_at
-
confirmed_awake_duration
```

ただし、途中覚醒の継続時間が不明な場合は、その時間を差し引かない。

---

# 14. 推定睡眠時間

入眠・起床時刻の一部が文脈から推定された場合は、

```text
estimated_sleep_duration
```

としてFactベースの睡眠時間と区別する。

回答では、

> 平均睡眠時間は約6時間40分と推定されます。

のように表現する。

---

# 15. 集計結果

Sleep Analyzerは以下の形式で結果を返す。

```json
{
  "analysis_type": "sleep_summary",
  "status": "complete",
  "period": {
    "from": "2026-07-01",
    "to": "2026-07-31"
  },
  "valid_sleep_days": 22,
  "average_sleep_minutes": 402,
  "minimum_sleep_minutes": 310,
  "maximum_sleep_minutes": 495,
  "explicit_awakening_count": 3,
  "derived_awakening_count": 5,
  "total_reference_awakening_count": 8
}
```

---

# 16. Data Insufficient

必要データが不足している場合は正常系として扱う。

例：

```json
{
  "analysis_type": "sleep_summary",
  "status": "insufficient_data",
  "missing": [
    "sleep_start",
    "sleep_end"
  ],
  "available": {
    "sleep_related_observations": 20
  }
}
```

---

# 17. Evidence

すべての分析結果にEvidenceを付与する。

例：

```json
{
  "finding": "derived_awakening",
  "occurred_at": "2026-07-30T00:18:00+09:00",
  "confidence": "medium_high",
  "source_observation_ids": [
    "obs_001",
    "obs_002",
    "obs_003"
  ]
}
```

---

# 18. 回答例

## 十分なデータがある場合

```text
この1ヶ月の平均睡眠時間は6時間42分でした。

「途中覚醒」と明示された記録は3回です。

加えて、睡眠中の大声・職員への呼びかけ・離床などから、途中覚醒があった可能性が高いと推定される事象が5回確認されています。

推定を含めた参考値では、途中覚醒に該当する可能性のある事象は合計8回です。
```

---

## データ不足の場合

```text
この1ヶ月の平均睡眠時間は確認できません。

睡眠関連の記録は20件ありますが、睡眠開始時刻と起床時刻が十分に記録されていないためです。

また、「途中覚醒」と明示された記録は確認できません。

一方で、睡眠中の大声や職員への呼びかけなど、途中覚醒があった可能性を示す記録は確認されています。
```

---

# 19. LLMへ渡す情報

LLMへ生のObservationを大量に渡すことを基本としない。

入力：

```text
User Question

+

Sleep Analysis Result

+

Evidence Summary

+

Fact / Derived / Unknown

+

Answer Policy
```

LLMは計算を行わない。

---

# 20. 実装モジュール案

```text
src/
└── analytics/
    └── sleep/
        ├── analyzer.ts
        ├── episode-builder.ts
        ├── fact-extractor.ts
        ├── awakening-deriver.ts
        ├── evidence.ts
        ├── mapper.ts
        ├── types.ts
        └── index.ts
```

---

# 21. Types

最低限以下の型を用意する。

```text
SleepFact

SleepEpisode

DerivedAwakening

SleepAnalysisResult

SleepEvidence
```

---

# 22. テストケース

最低限以下をテストする。

## Case 1

```text
22:00 入眠
06:00 起床
```

期待：

```text
睡眠時間8時間
途中覚醒0
```

---

## Case 2

```text
22:00 入眠
01:00 途中覚醒
01:10 再入眠
06:00 起床
```

期待：

```text
Explicit Awakening = 1
```

---

## Case 3

```text
22:00 入眠
01:00 大声
06:00 起床
```

期待：

```text
Derived Awakening = 1
```

---

## Case 4

```text
22:00 入眠
01:00 寝言
06:00 起床
```

期待：

```text
Derived Awakening confidence = low
standard集計では除外
```

---

## Case 5

```text
01:00 大声
```

のみ。

期待：

```text
Sleep Episodeなし
途中覚醒とは判断しない
```

---

## Case 6

開始・終了時刻なし。

期待：

```text
status = insufficient_data
```

---

# 23. MVP Definition of Done

UC-001は以下を満たした時点で完成とする。

```text
自然言語で睡眠質問

↓

Query Intent判定

↓

RISEN標準データ取得

↓

Fact抽出

↓

Sleep Episode構築

↓

Derived Awakening生成

↓

平均睡眠時間算出

↓

途中覚醒集計

↓

Evidence生成

↓

LLM説明

↓

元Observation確認
```

---

# 24. 基本原則

Sleep Analyzerは、人間の文脈理解を完全に排除しない。

一方で、文脈から導出した内容をFactとして扱わない。

```text
Fact

+

Context

↓

Derived Observation
```

Derived Observationは分析に利用できる。

ただし回答では必ず、

```text
「推定されます」

「可能性があります」
```

など、推定であることが分かる表現を使用する。

> **AIKO derives understanding from facts and context.**

> **It never presents derived observations as facts.**
