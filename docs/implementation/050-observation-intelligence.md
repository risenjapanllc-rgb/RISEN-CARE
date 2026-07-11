# 050 Observation Intelligence

Version: v1.0

---

# Purpose

Observation Intelligence は

Observation を利用者理解へ変換する

RISEN CARE の中核エンジンである。

Observation を分析し、

現在の状態と

次に確認すべき Observation を生成する。

---

# Role

Observation Intelligence は

Observation を統合し、

Explainable な利用者理解を生成する。

生成結果は

Resident Memory へ保存される。

---

# Architecture

```text
Observation

↓

Knowledge Graph

↓

Observation Sequence

↓

Episode

↓

Pattern

↓

Trigger

↓

Observation Intelligence

↓

Resident Memory
```

---

# Input

Observation Intelligence は

以下を入力として利用する。

- Resident Memory
- Observation
- Knowledge
- Observation Sequence
- Episode
- Pattern
- Trigger
- User State

---

# Observation Sequence

Observation を

時系列へ整理する。

例

```text
Observation

↓

Sort by DateTime

↓

Observation Sequence
```

---

# User State

Observation を集計し

現在の利用者状態を生成する。

例

- Event Counts
- Knowledge Counts
- Risk Counts
- Signals

---

# Episode

Observation を

時間単位でまとめる。

例

```text
食堂

↓

食事

↓

服薬

↓

居室
```

---

# Pattern

Episode を比較する。

抽出例

- 夜間覚醒
- 食事量低下
- 水分不足
- 排泄リズム

Pattern は

傾向であり

原因ではない。

---

# Trigger

Pattern と Observation を比較し

変化の可能性を抽出する。

例

- 転倒リスク
- 発熱傾向
- 食欲低下

Trigger は

Observation に基づく仮説である。

---

# Reasoning

OpenAI は

以下を統合して

現在の利用者理解を生成する。

- Resident Memory
- Observation
- Episode
- Pattern
- Trigger

---

# Output

Observation Intelligence は

以下を生成する。

- Summary
- Current Status
- Watch Points
- Important Patterns
- Recent Changes
- Confidence

---

# Resident Memory Update

Observation Intelligence 完了後

Resident Memory を

全面更新する。

更新方法

```text
UPSERT

Conflict

user_id
```

---

# Dashboard

Dashboard は

Resident Memory を表示する。

Observation Intelligence は

Dashboard を直接更新しない。

---

# AI Chat

AI Chat は

Resident Memory を利用する。

Observation Intelligence は

AI Chat の Context を生成する。

---

# Explainability

すべての理解は

Observation を根拠とする。

Observation に存在しない事実は

生成しない。

---

# Processing Flow

```text
Observation

↓

Observation Sequence

↓

User State

↓

Episode

↓

Pattern

↓

Trigger

↓

Prompt Builder

↓

OpenAI

↓

Observation Intelligence

↓

Resident Memory

↓

Dashboard
```

---

# GAS Functions

主な関数

```text
buildObservationSequence()

buildUserState()

buildEpisodes()

summarizeEpisode()

analyzeEpisodePattern()

analyzeTriggers()

createObservationIntelligenceReportPromptV2()

callOpenAIReasoningV2()

saveObservationIntelligenceReportV2()

runObservationIntelligenceV2()
```

---

# Performance

Observation Intelligence は

1利用者単位で実行する。

将来的には

バッチ処理へ拡張する。

---

# Future

追加予定

- Comparison Intelligence
- Prediction
- Preventive Care
- Recommendation
- Multi-day Pattern
- Seasonal Pattern

---

# Success Criteria

以下を満たす。

- Observation Sequence生成
- Episode生成
- Pattern分析
- Trigger分析
- Observation Intelligence生成
- Resident Memory更新
- Dashboard更新
- AI Chat利用可能

---

# Related Documents

- `020-google-apps-script.md`
- `030-supabase.md`
- `040-openai.md`
- `060-resident-memory.md`
- `070-search-engine.md`
- `080-dashboard.md`
- `090-deployment.md`
