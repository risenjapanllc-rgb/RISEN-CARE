# 195 AI Chat

Version: v2.0

---

# Purpose

AI Chat は

利用者理解を支援するための対話インターフェースである。

検索画面ではない。

AI と対話することが目的でもない。

Observation を利用者理解へ変え、

専門職の意思決定を支援することが目的である。

---

# Role

AI Chat は

Search Engine が生成した Context を利用し、

Explainable な回答を生成する。

AI は

Observation を整理し、

利用者理解を支援する。

最終判断は

専門職が行う。

---

# Architecture

```text
Question

↓

Question Analysis

↓

Search Engine

↓

AI Context

↓

OpenAI

↓

Answer
```

---

# Conversation Flow

```text
職員

↓

質問

↓

Question Analysis

↓

Search Planner

↓

Resident Memory

↓

Structured Search

↓

Keyword Search

↓

Semantic Search

↓

Episode Expansion

↓

Result Ranking

↓

AI Context Builder

↓

OpenAI

↓

回答
```

---

# Question Types

AI Chat は自然言語による質問を受け付ける。

例

- 最近変わったことは？
- 今日注意することは？
- 最近転倒はあった？
- 去年の夏は？
- 夜間の様子は？
- 食欲はどう？
- 水分摂取は？
- 排泄状況は？
- 最近興奮は？
- 同じことは以前もあった？
- この方らしさを教えて。

---

# AI Context

AI が利用する Context

- Resident Memory
- Observation
- Episode
- Pattern
- Knowledge
- User State

Search Engine が

必要最小限の Context を生成する。

AI は Context のみを利用する。

---

# Response Generation

AI は

Observation を整理し、

利用者理解を生成する。

回答には

可能な限り

- 現在の理解
- 根拠
- 注意点
- 次に確認するとよい Observation

を含める。

---

# Explainability

回答は

Observation を根拠とする。

AI は

Observation に存在しない事実を生成しない。

回答から

Observation まで追跡できる。

---

# Follow-up Questions

AI は

必要に応じて

次に確認するとよい Observation を提案する。

例

- 痛みはありましたか？
- 表情はどうでしたか？
- 歩行時の様子は？
- 食欲は変わりましたか？

Observation を増やすことで

利用者理解を深める。

---

# Response Style

回答は

短く

分かりやすく

専門職が

5〜10秒で理解できる文章とする。

必要に応じて

- 要約
- 箇条書き
- 時系列
- 根拠

を使い分ける。

---

# Limitations

AI は

以下を行わない。

- 診断
- 医療判断
- 原因の断定
- 将来の断定
- Observation に存在しない事実の生成

---

# Safety

AI は

専門職を支援する。

専門職の判断を置き換えない。

不確実な内容は

仮説として表現する。

---

# Future

将来的には

AI Chat を拡張し、

- Long-term Chat
- Family Chat
- Manager Chat
- Executive Chat
- Care Plan Chat
- Multi-agent Reasoning

へ対応する。

---

# Design Principles

AI Chat は

AI と会話するための画面ではない。

利用者理解へ到達するための

Conversation Interface である。

検索ではなく

理解を支援することが目的である。

---

# Related Documents

- 190 Care Intelligence Platform
- 191 Platform Architecture
- 192 Observation Pipeline
- 193 Resident Memory
- 194 Search Engine
- 196 Dashboard
