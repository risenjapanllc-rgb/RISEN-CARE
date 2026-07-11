# 194 Search Engine

Version: v1.0

---

# Purpose

Search Engine は

AI が理解するために必要な情報だけを取得する。

AI は検索を行わない。

Search Engine が

Observation を収集・整理し、

AI へ渡す。

---

# Role

Search Engine は

RISEN CARE の Intelligence Platform において、

Observation と AI を接続する中核コンポーネントである。

---

# Architecture

```
Question

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
```

---

# Search Strategy

検索は段階的に実施する。

## Level 1

Resident Memory

利用者理解を取得する。

約70〜80%の質問は

Resident Memory のみで回答できることを目指す。

---

## Level 2

Observation Search

質問に関連する Observation を取得する。

例

- 最近
- 夜間
- 食事
- 排泄
- 水分
- 転倒
- 発熱

---

## Level 3

Knowledge Search

Knowledge Graph を利用し、

Observation の意味を補完する。

---

## Level 4

Episode Search

時間的なまとまりを取得する。

利用者行動の流れを理解する。

---

## Level 5

Pattern Search

継続している Pattern を取得する。

---

## Level 6

Trigger Search

状態変化につながる可能性のある

Trigger を取得する。

---

# Search Context

検索開始時に

質問内容を解析する。

例

質問

「最近転倒した？」

↓

Search Context

- 期間：最近
- Category：転倒
- Related：歩行・ふらつき・移動

---

# Prompt Builder

取得した情報を

AI が理解しやすい形へ統合する。

入力例

- Resident Memory
- Observation
- Knowledge
- Episode
- Pattern
- Trigger

---

# AI Input Optimization

AI へ渡す情報は

必要最小限とする。

目安

- Resident Memory：1件
- Observation：20件以内
- Episode：5件以内
- Pattern：5件以内
- Trigger：5件以内

---

# Explainability

AI の回答は

検索結果を根拠とする。

検索されなかった情報は

回答根拠に含めない。

---

# Design Principles

## Search First

検索を先に行う。

AI は検索しない。

---

## Minimal Context

必要最小限の情報のみ

AI へ渡す。

---

## Explainable

検索結果が

回答根拠となる。

---

## Scalable

利用者数や Observation 数が増えても

同じ検索方式で対応できる。

---

# Future

将来的に追加する検索

- Vector Search
- Semantic Search
- Similar Resident Search
- Facility-wide Search
- Cross-facility Search

---

# Related Documents

- 190 Care Intelligence Platform
- 191 Platform Architecture
- 192 Observation Pipeline
- 193 Resident Memory
- 195 AI Chat
