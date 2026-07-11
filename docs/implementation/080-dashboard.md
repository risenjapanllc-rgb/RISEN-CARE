# 080 Dashboard

Version: v1.0

---

# Purpose

Dashboard は

利用者の現在の状態を

最短時間で理解するための画面である。

Observation を表示する画面ではない。

Observation Intelligence の結果を表示する画面である。

---

# Role

Dashboard は

Resident Memory を中心に

利用者理解を表示する。

Dashboard 自体は

分析や推論を行わない。

---

# Architecture

```text
Resident Memory

↓

Dashboard API

↓

Dashboard

↓

Care Professional
```

---

# Main Components

Dashboard は

以下の情報で構成する。

- Current Status
- Resident Summary
- Watch Points
- Important Patterns
- Recent Changes
- Recent Observations
- AI Chat

---

# Current Status

現在最も重要な状態を表示する。

例

- 安定
- 継続観察
- 注意
- 状態変化

利用者を開いた時

最初に表示する。

---

# Resident Summary

現在の利用者理解を

2〜4文で表示する。

例

```text
食事・排泄は安定している。

歩行時のふらつきがあり

移動時の継続観察が必要。
```

---

# Watch Points

今日確認したい Observation を表示する。

例

- 食後の歩行
- 水分摂取
- 排泄状況
- 表情の変化

Observation Intelligence が生成する。

---

# Important Patterns

継続している Pattern を表示する。

例

- 夜間覚醒
- 食事量安定
- 排泄リズム
- 水分摂取

---

# Recent Changes

最近の重要な変化を表示する。

例

- 転倒
- 発熱
- 食欲低下
- 行動変化

---

# Recent Observations

最新の日常記録を表示する。

表示件数

```text
20件
```

例

- 食事
- 排泄
- 水分
- バイタル
- 睡眠
- 行動

Observation は

時系列で表示する。

---

# AI Chat

Dashboard から

Resident AI Chat を起動できる。

Resident Memory を共有し

継続した対話を行う。

---

# Data Sources

Dashboard は

以下を取得する。

```text
Resident Memory

↓

Recent Observations

↓

User Information
```

Observation Intelligence は

直接実行しない。

---

# Data Flow

```text
Dashboard

↓

loadDashboardData()

↓

Supabase

↓

Resident Memory

↓

Observation

↓

Dashboard UI
```

---

# GAS Functions

主な関数

```text
loadDashboardData()

getResidentMemory()

getRecentObservations()

buildDashboardResponse()
```

---

# Display Principles

Dashboard は

現在を見る画面である。

分析結果より

今必要な情報を優先する。

---

# Explainability

表示される内容は

Observation を根拠とする。

Resident Memory の内容を

そのまま表示する。

---

# Performance

Dashboard は

高速表示を優先する。

目標

- Resident Memory取得

100ms以内

- Dashboard表示

3秒以内

---

# UI Principles

利用者を開いて

5秒以内に理解できる画面を目指す。

優先順位

```text
Current Status

↓

Watch Points

↓

Resident Summary

↓

Recent Changes

↓

Recent Observations

↓

AI Chat
```

---

# Future

追加予定

- Timeline View
- Trend Graph
- Risk Timeline
- Similar Episodes
- Family View
- Mobile Dashboard

---

# Success Criteria

以下を満たす。

- Resident Memory表示
- Summary表示
- Watch Points表示
- Pattern表示
- Recent Changes表示
- Recent Observations表示
- AI Chat起動
- 高速表示

---

# Related Documents

- `020-google-apps-script.md`
- `030-supabase.md`
- `040-openai.md`
- `050-observation-intelligence.md`
- `060-resident-memory.md`
- `070-search-engine.md`
- `090-deployment.md`
