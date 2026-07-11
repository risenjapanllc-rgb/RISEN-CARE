# 040 OpenAI

Version: v1.0

---

# Purpose

本書は、RISEN CARE における OpenAI の利用方針と実装方法を定義する。

OpenAI は

Observation を理解し、

Observation Intelligence を生成する

Reasoning Engine として利用する。

---

# Role

OpenAI は以下を担当する。

- Observation Intelligence
- Resident AI Chat
- Comparison Intelligence
- Recommendation
- Reasoning

OpenAI は

データベースではない。

検索エンジンでもない。

---

# Architecture

```text
Observation

↓

Search Engine

↓

Prompt Builder

↓

OpenAI Responses API

↓

Reasoning

↓

Observation Intelligence

↓

Resident Memory
```

---

# Design Principles

OpenAI は

Observation を直接検索しない。

必要な Observation は

Search Engine が取得する。

OpenAI は

渡された Context のみを利用する。

---

# Responsibilities

OpenAI が担当する。

- Observation の理解
- Pattern の整理
- 利用者理解
- Explainable な文章生成
- Dashboard Summary
- AI Chat

担当しない。

- データ保存
- Observation検索
- SQL実行
- 業務ロジック
- 権限制御

---

# API

利用API

```text
Responses API
```

Endpoint

```text
https://api.openai.com/v1/responses
```

---

# Model

現在利用

```text
gpt-5.5
```

モデルは

設定値で変更可能とする。

---

# Prompt Structure

Prompt は

以下の順番で構成する。

```text
System Prompt

↓

Resident Memory

↓

User State

↓

Observation

↓

Knowledge

↓

Episode

↓

Pattern

↓

Question

↓

Output Format
```

---

# System Prompt

AI の役割を定義する。

例

- Observation First
- Explainable AI
- Human-centered
- No Diagnosis
- No Hallucination

---

# Resident Context

Resident Memory を

最初に渡す。

含める内容

- Current Status
- Summary
- Watch Points
- Important Patterns
- Recent Changes

---

# Observation Context

必要な Observation のみ渡す。

例

- 最新20件
- 指定期間
- 指定カテゴリ
- Episode

全 Observation は渡さない。

---

# Knowledge Context

Knowledge Graph を渡す。

例

- Knowledge Nodes
- Relations
- Categories

Knowledge により

Observation の意味を理解する。

---

# Output

OpenAI の出力例

- Dashboard Summary
- Current Status
- Watch Points
- AI Chat Answer
- Observation Intelligence Report

JSON を基本とする。

---

# Response Processing

Responses API の出力から

output_text を取得する。

JSON が返る場合は

パースして利用する。

---

# Temperature

Observation Intelligence

```text
0.2
```

Resident AI Chat

```text
0.4
```

文章生成

```text
0.6
```

創造性より

再現性を優先する。

---

# Explainability

AI は

必ず Observation を根拠とする。

推測は

推測として表現する。

Observation に存在しない事実は生成しない。

---

# Safety

AI は

診断しない。

原因を断定しない。

治療を指示しない。

専門職の判断を支援する。

---

# Cost Optimization

入力を最小化する。

基本方針

- Resident Memory を優先
- 必要 Observation のみ取得
- Search Engine を利用
- Prompt を短くする

---

# Performance

AI の前処理は

Supabase と GAS が担当する。

OpenAI は

Reasoning のみに集中する。

---

# Future

将来的には

- Structured Outputs
- Tool Calling
- Multi-step Reasoning
- Multi-agent
- Voice Interface

へ対応する。

---

# Success Criteria

以下を満たす。

- Explainable Answer
- Hallucination の抑制
- 高速応答
- Token 削減
- Resident Memory 活用
- Search Engine 活用

---

# Related Documents

- `020-google-apps-script.md`
- `030-supabase.md`
- `050-observation-intelligence.md`
- `060-resident-memory.md`
- `070-search-engine.md`
- `080-dashboard.md`
