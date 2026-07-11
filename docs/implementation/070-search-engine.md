# 070 Search Engine

Version: v1.0

---

# Purpose

Search Engine は

AI が必要な情報だけを取得するための検索基盤である。

Observation が増え続けても、

高速・低コスト・Explainable な AI を実現することを目的とする。

---

# Role

Search Engine は

Observation を検索し、

AI に渡す Context を生成する。

AI は

検索を行わない。

---

# Architecture

```text
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

検索は

段階的に実施する。

---

## Level 1

### Resident Memory

最初に

Resident Memory を取得する。

取得内容

- Current Status
- Summary
- Watch Points
- Important Patterns
- Recent Changes

約80%の質問は

Resident Memoryだけで回答できることを目標とする。

---

## Level 2

### Observation Search

必要な Observation を取得する。

検索例

- 最近
- 今日
- 昨日
- 夜間
- 食事
- 排泄
- 水分
- 転倒
- 発熱

取得件数は必要最小限とする。

---

## Level 3

### Knowledge Search

Observation に対応する

Knowledge を取得する。

例

```text
Observation

↓

Knowledge Nodes

↓

Knowledge Relations
```

---

## Level 4

### Episode Search

Observation を

Episode 単位で取得する。

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

## Level 5

### Pattern Search

継続している Pattern を取得する。

例

- 夜間覚醒
- 食事量低下
- 水分不足
- 排泄リズム

---

## Level 6

### Trigger Search

Observation の変化を取得する。

例

- 転倒リスク
- 発熱傾向
- 食欲低下
- 行動変化

Trigger は

Observation に基づく仮説である。

---

# Search Context

質問から

検索条件を生成する。

例

質問

```text
最近転倒した？
```

↓

Search Context

```text
期間

最近

Category

転倒

Related

歩行

移動

ふらつき
```

---

# Prompt Builder

検索結果を

AI 用 Context に変換する。

入力

- Resident Memory
- Observation
- Knowledge
- Episode
- Pattern
- Trigger

出力

```text
Resident Context
```

---

# Search Priority

優先順位

```text
Resident Memory

↓

Observation

↓

Knowledge

↓

Episode

↓

Pattern

↓

Trigger
```

必要最小限のみ

AIへ渡す。

---

# AI Input Optimization

推奨件数

```text
Resident Memory

1

Observation

20件以内

Episode

5件以内

Pattern

5件以内

Trigger

5件以内
```

大量データを

そのまま渡さない。

---

# Search Sources

検索対象

```text
resident_memory

events

knowledge_nodes

knowledge_relations

episodes

patterns

triggers
```

---

# GAS

主要関数

```text
buildResidentSearchContext()

searchResidentMemory()

searchObservations()

searchKnowledge()

searchEpisodes()

searchPatterns()

searchTriggers()

buildPromptContext()
```

---

# Dashboard

Dashboard は

Resident Memory を優先表示する。

必要時のみ

Observation を取得する。

---

# AI Chat

AI Chat は

Search Engine を利用する。

質問ごとに

検索結果を生成する。

---

# Explainability

回答は

検索結果を根拠とする。

検索されなかった情報は

回答根拠に利用しない。

---

# Performance

目標

- 高速検索
- Token削減
- Prompt最適化
- API費用削減
- 長期データ対応

---

# Future

追加予定

- pgvector
- Semantic Search
- Full Text Search
- Similar Resident Search
- Facility Search
- Multi Facility Search
- Hybrid Search

---

# Design Principles

## Search First

AIは検索しない。

Search Engine が検索する。

---

## Explainable

検索結果が

回答根拠となる。

---

## Minimal Context

必要最小限だけ

AIへ渡す。

---

## Scalable

Observation が

数百万件になっても

同じ仕組みで動作する。

---

# Success Criteria

以下を満たす。

- Resident Memory検索
- Observation検索
- Knowledge検索
- Episode検索
- Pattern検索
- Trigger検索
- Prompt生成
- AI回答
- Token削減
- 高速応答

---

# Related Documents

- `020-google-apps-script.md`
- `030-supabase.md`
- `040-openai.md`
- `050-observation-intelligence.md`
- `060-resident-memory.md`
- `080-dashboard.md`
- `090-deployment.md`
