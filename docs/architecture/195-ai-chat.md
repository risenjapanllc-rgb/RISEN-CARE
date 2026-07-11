# 195 AI Chat

Version: v1.0

---

# Purpose

AI Chat は

利用者理解を支援するための対話インターフェースである。

利用者の情報を検索する画面ではなく、

Observation を基に利用者理解へ到達するための対話を提供する。

---

# Role

AI Chat は

Search Engine が取得した情報を利用し、

Explainable な回答を生成する。

AI は

Observation を整理し、

職員の判断を支援する。

最終判断は

専門職が行う。

---

# Architecture

```
Question

↓

Search Context

↓

Search Engine

↓

Resident Context

↓

OpenAI

↓

Answer
```

---

# Conversation Flow

```
職員

↓

質問

↓

Search Context

↓

Resident Memory

↓

Observation Search

↓

Knowledge Search

↓

Episode Search

↓

Pattern Search

↓

Trigger Search

↓

Prompt Builder

↓

OpenAI

↓

回答
```

---

# Supported Questions

AI Chat は

自然言語による質問を受け付ける。

例

- 最近変わったことは？
- 今日注意することは？
- 夜間の様子は？
- 最近転倒はあった？
- 食欲はどう？
- 水分摂取は十分？
- 排泄状況は？
- この方らしさを教えて。
- 去年の夏はどうだった？
- 同じことは以前もあった？

---

# Response Principles

AI は

Observation を根拠として回答する。

回答には

可能な限り

- Observation
- Episode
- Pattern
- Trigger

の根拠を含める。

---

# Explainability

回答には

可能な限り

以下を示す。

- 根拠となる Observation
- 関連 Episode
- Pattern
- Trigger
- Resident Memory

Observation に存在しない事実は生成しない。

---

# Context

AI が利用する Context

- Resident Memory
- Observation
- Knowledge
- Episode
- Pattern
- Trigger
- User State

必要な情報のみ

Search Engine が取得する。

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

支援者である。

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
- Care Plan Chat
- Multi-agent Reasoning

へ対応する。

---

# Related Documents

- 190 Care Intelligence Platform
- 191 Platform Architecture
- 192 Observation Pipeline
- 193 Resident Memory
- 194 Search Engine
- 196 Dashboard
