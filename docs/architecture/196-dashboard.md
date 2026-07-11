# 196 Dashboard

Version: v2.0

---

# Purpose

Dashboard は

利用者の現在の状態を短時間で理解するための画面である。

Dashboard は

Observation Intelligence の結果を可視化し、

専門職が

「今、この利用者をどう理解するか」

「次に何を確認するか」

をすぐに把握できることを目的とする。

---

# Role

Dashboard は

Intelligence Engine が生成した利用者理解を表示する。

Dashboard 自体は

検索・分析・推論を行わない。

AI は一つ。

Dashboard はその結果を表示する。

---

# Architecture

```text
Observation

↓

Knowledge

↓

Observation Intelligence

↓

Resident Memory

↓

Search Engine

↓

Reasoning Engine

↓

Dashboard
```

---

# Dashboard Components

Dashboard は

以下の情報を表示する。

- Current Understanding
- Current Status
- Resident Memory
- Watch Points
- Recent Changes
- Important Patterns
- Observation Timeline
- Episode Timeline
- Recommendations
- AI Chat

---

# Current Understanding

現在の利用者理解を

2〜4文で表示する。

Dashboard を開いた瞬間に

利用者像が把握できることを目指す。

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

# Resident Memory

Resident Memory の最新状態を表示する。

例

- 現在の状態
- 支援時の配慮
- 最近の変化
- 利用者らしさ

Dashboard は

Resident Memory の入口となる。

---

# Watch Points

今日確認すべき Observation を表示する。

例

- 水分摂取量
- 食後の歩行
- 夜間覚醒
- 排泄後の表情

Observation を増やすための

行動指針となる。

---

# Recent Changes

最近の重要な変化を表示する。

例

- 倒れ込み
- 発熱
- 食欲低下
- 行動変化

利用者理解の変化を最初に伝える。

---

# Important Patterns

継続して観察されている Pattern を表示する。

例

- 夜間覚醒が継続
- 食事摂取は安定
- 排泄リズムは一定

Pattern は

Observation の積み重ねから生成される。

---

# Observation Timeline

最新の Observation を

時系列で表示する。

例

- 食事
- 排泄
- 水分
- バイタル
- 睡眠
- 行動

Observation は

利用者理解の根拠となる。

---

# Episode Timeline

Observation を

Episode 単位で表示する。

例

```text
食事

↓

興奮

↓

倒れ込み

↓

居室誘導

↓

バイタル確認
```

Episode は

単独 Observation より

理解しやすい単位である。

---

# Recommendations

Observation Intelligence が

次に確認するとよい Observation を表示する。

例

- 痛みの有無
- 歩行状態
- 水分摂取量
- 表情の変化

Recommendation は

専門職の判断を支援する。

---

# AI Chat

Dashboard から

AI Chat を起動できる。

Dashboard の利用者理解を引き継ぎ、

継続した対話を行う。

---

# Update Timing

Dashboard は

Observation Intelligence 更新後に同期される。

Resident Memory と常に一致する。

---

# Explainability

Dashboard に表示される情報は

Observation を根拠とする。

利用者理解から

Observation まで追跡できる。

---

# Design Principles

## Understanding First

利用者理解を最初に表示する。

---

## Current First

現在最も重要な状態を最優先で表示する。

---

## Action Oriented

「次に何を確認するか」

を優先する。

---

## Explainable

すべての表示は

Observation を根拠とする。

---

## Simple

5〜10秒で理解できる画面を目指す。

---

# Future

将来的には

以下を追加する。

- Timeline View
- Trend Analysis
- Risk Trend
- Similar Episodes
- Comparison View
- Family Summary
- Mobile Dashboard

---

# Related Documents

- 190 Care Intelligence Platform
- 191 Platform Architecture
- 192 Observation Pipeline
- 193 Resident Memory
- 194 Search Engine
- 195 AI Chat
- 197 Management Intelligence
