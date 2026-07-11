# 193 Resident Memory

Version: v1.0

---

# Purpose

Resident Memory は、

利用者理解を継続的に蓄積する長期記憶である。

Observation の履歴そのものではなく、

Observation Intelligence によって生成された

「現在の利用者理解」を保持する。

---

# Role

Resident Memory は

AI と職員が

利用者を理解するための基盤となる。

毎日の Observation Intelligence により

継続的に更新される。

---

# Architecture

```
Observation

↓

Knowledge

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

# Stored Information

Resident Memory は

以下の情報を保持する。

- Current Status
- Resident Summary
- Watch Points
- Support Preferences
- Important Patterns
- Recent Changes
- Confidence
- Generated At

---

# Current Status

現在最も重要な状態を保持する。

例

- 安定
- 注意が必要
- 継続観察
- 状態変化あり

Dashboard の最上部で利用する。

---

# Resident Summary

現在の利用者理解を

短い文章で保持する。

例

「食事・排泄は安定しているが、

歩行時のふらつきに継続した観察が必要。」

Resident Summary は

AI Chat の初期コンテキストとして利用する。

---

# Watch Points

職員が

今日確認すべき Observation を保持する。

例

- 食後の歩行
- 水分摂取量
- 排泄後の表情
- 夜間覚醒

Dashboard に表示する。

---

# Support Preferences

利用者ごとの支援上の配慮を保持する。

例

- 声掛けで安心する
- 左側から介助する
- 食事はゆっくり進める

Observation が蓄積されることで

更新される。

---

# Important Patterns

継続して確認されている Pattern を保持する。

例

- 夜間覚醒が続く
- 食事摂取量が安定
- 排泄リズムが一定

Pattern の要約として利用する。

---

# Recent Changes

最近の重要な変化を保持する。

例

- 廊下で倒れ込み
- 発熱
- 食欲低下
- 歩行状態の変化

AI Chat と Dashboard で利用する。

---

# Confidence

Resident Memory の確信度を保持する。

値

- High
- Medium
- Low

Observation 数や根拠に応じて決定する。

---

# Update Timing

Resident Memory は

Observation Intelligence の実行後に更新される。

更新方法

- Upsert
- 全面更新

履歴ではなく

最新状態を保持する。

---

# Usage

Resident Memory は

以下で利用される。

- Dashboard
- AI Chat
- Management Intelligence
- Facility Intelligence

---

# Design Principles

## Long-term Memory

Resident Memory は

利用者理解の長期記憶である。

---

## Always Current

常に最新状態を保持する。

---

## Explainable

Resident Memory の内容は

Observation を根拠とする。

---

## Human-centered

Resident Memory は

職員の判断を支援する。

最終判断は

専門職が行う。

---

# Future

将来的には

Resident Memory に

以下を追加する。

- Life History
- Family Information
- Care Preferences
- Communication Style
- ADL Trends
- Cognitive Trends

---

# Related Documents

- 190 Care Intelligence Platform
- 191 Platform Architecture
- 192 Observation Pipeline
- 194 Search Engine
- 195 AI Chat
