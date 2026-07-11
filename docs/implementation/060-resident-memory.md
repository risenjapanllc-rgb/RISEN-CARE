# 060 Resident Memory

Version: v1.0

---

# Purpose

Resident Memory は

Observation Intelligence によって生成された

利用者理解を保持する長期記憶である。

Observation を保存するものではない。

Observation を統合した

「現在の利用者理解」を保存する。

---

# Role

Resident Memory は

AI と職員が

共通して利用する

利用者理解の基盤となる。

Dashboard

AI Chat

Management Intelligence

すべて

Resident Memory を起点とする。

---

# Architecture

```text
Observation

↓

Observation Intelligence

↓

Resident Memory

↓

Dashboard

AI Chat

Management Intelligence
```

---

# Storage

保存先

```text
public.resident_memory
```

更新方式

```text
UPSERT
```

Conflict Key

```text
user_id
```

---

# Data Structure

Resident Memory は

以下を保持する。

```text
user_id

summary

current_status

watch_points

support_preferences

important_patterns

recent_changes

confidence

source_report_id

generated_at

updated_at
```

---

# Summary

利用者理解を

2〜4文程度で保存する。

例

```text
食事・排泄は安定している。

歩行時のふらつきがあり、

移動時の継続観察が必要。
```

Dashboard と

AI Chat の起点となる。

---

# Current Status

現在最も重要な状態を保持する。

例

```json
{
  "label": "歩行時の継続観察が必要",
  "level": "attention"
}
```

---

# Watch Points

今日確認したい Observation を保持する。

例

```json
[
  "食後の歩行",
  "水分摂取量",
  "排泄後の表情"
]
```

Dashboard に表示する。

---

# Support Preferences

支援時の配慮を保持する。

例

```json
[
  "ゆっくり声掛けする",
  "左側から介助する"
]
```

Observation が蓄積されることで

更新される。

---

# Important Patterns

継続している Pattern を保存する。

例

```json
[
  {
    "label":"夜間覚醒",
    "detail":"週4回確認"
  }
]
```

---

# Recent Changes

最近の重要な変化を保存する。

例

```json
[
  {
    "date":"2026-07-10",
    "summary":"廊下で倒れ込み"
  }
]
```

Dashboard に表示する。

---

# Confidence

AI の確信度を保存する。

値

```text
high

medium

low
```

Observation 数や

根拠量によって決定する。

---

# Update Flow

```text
Observation

↓

Observation Intelligence

↓

Resident Memory JSON

↓

UPSERT

↓

Dashboard
```

---

# GAS

主要関数

```text
saveObservationIntelligenceReportV2()

upsertResidentMemoryV2()

upsertSupabaseRowV2_()
```

Resident Memory は

Observation Intelligence の保存後に更新する。

---

# API

取得

```text
getResidentMemory(userId)
```

返却

```json
{
  "summary": "...",
  "current_status": {},
  "watch_points": [],
  "important_patterns": []
}
```

---

# Dashboard

Dashboard は

Resident Memory を表示する。

表示項目

- Current Status
- Summary
- Watch Points
- Important Patterns
- Recent Changes

---

# AI Chat

Resident Memory を

最初の Context として利用する。

AI は

Resident Memory を読んでから

Observation を読む。

---

# Design Principles

## Long-term Memory

Observation は履歴。

Resident Memory は理解。

---

## Always Current

常に最新状態へ更新する。

履歴ではなく

現在を保持する。

---

## Explainable

Resident Memory は

Observation を根拠とする。

---

## Human-centered

AI は支援する。

最終判断は

専門職が行う。

---

# Future

追加予定

- Life History
- ADL Trends
- Cognitive Trends
- Communication Style
- Family Information
- Care Preferences

---

# Success Criteria

以下を満たす。

- Resident Memory 保存
- UPSERT 成功
- Dashboard 表示
- AI Chat 利用
- Current Status 更新
- Summary 更新
- Watch Points 更新

---

# Related Documents

- `020-google-apps-script.md`
- `030-supabase.md`
- `040-openai.md`
- `050-observation-intelligence.md`
- `070-search-engine.md`
- `080-dashboard.md`
- `090-deployment.md`
