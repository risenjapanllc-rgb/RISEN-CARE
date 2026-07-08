# RISEN

>RISEN helps people understand what matters before it becomes a crisis.

>（RISENは、大きな問題になる前に、本当に大切な変化に気づくことを支援する。）

**An Observation Intelligence Platform**

**From Observation to Understanding**

**Understanding enables Better Care.**

**Observe.**
**Understand.**
**Care.**



RISEN transforms observations into knowledge, knowledge into understanding, and understanding into better care.

It is designed to help care professionals discover meaningful patterns, understand changes over time, and support people through explainable AI.

> **From Observation to Knowledge**

RISENは、介護・福祉現場で発生するObservation（観察・記録）をKnowledge（知識）へ変換し、AIによる推論・可視化・意思決定支援へつなげるKnowledge Platformです。

Observationを単なる記録として保存するのではなく、組織が継続的に育てるKnowledgeへ変換することを目的としています。

---

# Mission

**理解から、価値をつくる。**

RISENは現場の出来事をObservationとして収集し、Knowledgeとして構造化し、組織全体で共有・活用できる知識資産へ育てます。

---

# Vision

RISENは介護・福祉分野におけるKnowledge Platformを目指します。

Observationを起点として、

- 現場の可視化
- 行政レビュー支援
- Explainable AI
- Knowledge Graph
- 組織Knowledgeの継承

を実現します。

---

# Philosophy

**「記録を残す」のではなく、知識を育てる。**

---

# Observation First Architecture

RISENはObservation First Architectureを採用します。

```
Google Spreadsheet
        ↓

Observation

├── Structured Observation
└── Narrative Observation

        ↓

Knowledge Graph

        ↓

Review

        ↓

AI Reasoning

        ↓

Recommendation

        ↓

Dashboard

        ↓

Administration
```

ObservationはRISENの唯一のSource of Truthです。

KnowledgeはObservationの意味を定義します。

Reviewは行政・組織の視点を追加します。

AIはKnowledge Graphを中心に推論し、必要に応じてObservationの文章（Narrative Observation）を参照します。

---

# Core Principles

RISENでは以下の原則を採用します。

- Observation is the Source of Truth
- ObservationはStructured ObservationとNarrative Observationで構成される
- コードではなくMasterを育てる
- Event Mapperで施設差を吸収する
- Reviewで行政差を吸収する
- KnowledgeでObservationの意味を定義する
- AIはKnowledge Graphを基盤として推論する
- Narrative Observationは文脈・ニュアンスを補完する

---

# Repository Structure

```text
RISEN/

├── README.md
│
├── docs/
│   ├── architecture/
│   │   ├── 001-risen-observation-architecture-v2.md
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
└── .github/
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

RISEN uses Supabase (PostgreSQL).

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

```
Observation

↓

Event Mapper

↓

Event Type

↓

Knowledge Graph

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
- Knowledge Graph
- AI (LLM)

---

# Getting Started

Start with:

```
docs/implementation/010-implementation-guide.md
```

---

# Development Policy

RISEN development follows these priorities.

1. Preserve Observation.
2. Enrich Knowledge through master data.
3. Absorb facility differences using Event Mapper.
4. Absorb administrative differences using Review.
5. Build Knowledge Graph before AI.
6. Modify application code only when master data cannot solve the problem.

---

# Current Status

- ✅ Observation Platform
- ✅ Review Platform
- ✅ Knowledge Platform
- ✅ Knowledge Graph
- ✅ Database Design
- ✅ GAS Synchronization
- 🔄 AI Reasoning
- ⏳ Dashboard
- ⏳ Administration

---

# License

This project is currently under development.

---

# RISEN

**From Observation to Knowledge**

Build Knowledge.

Support People.

Empower Care.
