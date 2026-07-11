# 196 Dashboard

Version: v1.0

---

# Purpose

Dashboard は

利用者の現在の状態を

短時間で理解するための画面である。

職員が

「今、何を確認すべきか」

を最初に把握できることを目的とする。

---

# Role

Dashboard は

Observation Intelligence の結果を表示する。

Dashboard 自体は

分析や推論を行わない。

---

# Architecture

```
Resident Memory

↓

Dashboard API

↓

Dashboard UI
```

---

# Display Components

Dashboard は

以下の情報を表示する。

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
- 注意が必要
- 状態変化あり

Dashboard の最上部に表示する。

---

# Resident Summary

現在の利用者理解を

2〜4文で表示する。

利用者を理解するための

最初の説明となる。

---

# Watch Points

今日確認すべき Observation を表示する。

例

- 水分摂取量
- 食後の歩行
- 夜間覚醒
- 排泄後の表情

---

# Important Patterns

継続して観察されている Pattern を表示する。

例

- 夜間覚醒が継続
- 食事摂取は安定
- 排泄リズムは一定

---

# Recent Changes

最近の重要な変化を表示する。

例

- 倒れ込み
- 発熱
- 食欲低下
- 行動変化

---

# Recent Observations

最新の日常記録を

時系列で表示する。

例

- 食事
- 排泄
- 水分
- バイタル
- 睡眠
- 行動

---

# AI Chat

Dashboard から

AI Chat を起動できる。

Resident Memory を利用し、

継続した対話を行う。

---

# Update Timing

Dashboard は

Observation Intelligence 実行後に更新される。

Resident Memory と同期する。

---

# Design Principles

## Current First

現在の状態を

最初に伝える。

---

## Action Oriented

「次に何を確認するか」

を優先する。

---

## Explainable

表示内容は

Observation を根拠とする。

---

## Simple

5〜10秒で理解できる画面を目指す。

---

# Future

将来的には

以下を追加する。

- Timeline View
- Trend Graph
- Risk Trend
- Similar Episodes
- Family Summary

---

# Related Documents

- 190 Care Intelligence Platform
- 193 Resident Memory
- 194 Search Engine
- 195 AI Chat
- 197 Management Intelligence
