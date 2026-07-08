# RISEN Knowledge OS

> **From Observation to Knowledge**

RISENは、介護・福祉現場で発生するObservation（観察・記録）をKnowledge（知識）へ変換し、AIによる推論・可視化・意思決定支援へつなげるKnowledge Platformです。

---

# Mission

**理解から、価値をつくる。**

RISENは現場の出来事を単なる記録として保存するのではなく、Observationとして収集し、Knowledgeとして育てることを目的としています。

データを蓄積するだけではなく、組織全体で共有・活用できる知識資産へ変換します。

---

# Vision

RISENは介護・福祉分野におけるKnowledge Platformを目指します。

Observationを起点として、

- 現場の可視化
- 行政レビュー支援
- AIによる推論
- 組織Knowledgeの蓄積

を実現します。

---

# Philosophy

**「記録を残す」のではなく、知識を育てる。**

---

# Observation First Architecture

RISENはObservation First Architectureを採用します。

```text
Google Spreadsheet
        ↓
Observation (events)
        ↓
Event Type
        ↓
Knowledge
        ↓
Review
        ↓
AI Reasoning
        ↓
Dashboard
        ↓
Administration
```

AIは文章ではなくObservationとKnowledgeを扱います。

---

# Core Principles

RISENでは以下の原則を採用します。

- Observation First
- コードよりMasterを育てる
- Event Mapperで施設差を吸収する
- Reviewで行政差を吸収する
- Knowledgeで意味を定義する
- AIはKnowledgeを入力として推論する

---

# Repository Structure

```text
RISEN/

├── docs/
│   ├── architecture/
│   │   ├── 001-risen-observation-architecture-v1.md
│   │   ├── 002-data-model.md
│   │   ├── 003-knowledge-model.md
│   │   ├── 004-review-model.md
│   │   ├── 005-ai-reasoning.md
│   │   ├── 006-knowledge-master-specification.md
│   │   ├── 007-development-conventions.md
│   │   └── 009-roadmap.md
│   │
│   └── implementation/
│       └── 010-implementation-guide.md
│
├── sql/
│   ├── schema/
│   ├── master/
│   ├── migration/
│   └── views/
│
├── gas/
│
├── dashboard/
│
└── README.md
```

---

# Documentation

## Architecture

| No | Document |
|----|----------|
|001|Observation Architecture|
|002|Data Model|
|003|Knowledge Model|
|004|Review Model|
|005|AI Reasoning|
|006|Knowledge Master Specification|
|007|Development Conventions|
|009|Roadmap|

---

## Implementation

| No | Document |
|----|----------|
|010|Implementation Guide|

---

# Database

RISENはSupabase（PostgreSQL）を採用します。

## Observation

- users
- events
- event_categories
- event_types
- event_mapper

## Review

- review_types
- event_type_review_types

## Knowledge

- knowledge_categories
- knowledge_nodes
- knowledge_relations
- event_type_knowledge

---

# Development Flow

```text
Observation
        ↓
Event Mapper
        ↓
Event Type
        ↓
Knowledge
        ↓
Review
        ↓
AI Reasoning
        ↓
Recommendation
        ↓
Dashboard
```

---

# Technology Stack

- Google Spreadsheet
- Google Apps Script (GAS)
- Supabase
- PostgreSQL
- GitHub
- AI (LLM)
- Dashboard

---

# Getting Started

RISENを新しく構築する場合は、

```
docs/implementation/010-implementation-guide.md
```

から開始してください。

---

# Development Policy

RISENでは以下を最優先とします。

1. Observationに意味を追加する
2. Event Mapperで施設差を吸収する
3. Reviewで行政差を吸収する
4. Knowledgeで意味を定義する
5. コード変更は最後の手段とする

---

# Roadmap

現在の開発フェーズ

- ✅ Observation Platform
- ✅ Review Platform
- ✅ Knowledge Platform
- ✅ Database Design
- ✅ GAS Synchronization
- 🔄 Knowledge Graph
- 🔄 AI Reasoning
- ⏳ Dashboard
- ⏳ Administration

---

# License

This project is under development.

---

# RISEN

**From Observation to Knowledge**

Build knowledge.  
Support people.  
Empower care.
