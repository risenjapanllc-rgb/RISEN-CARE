# 140 RISEN Development Roadmap

Version: 0.1

---

# Current Status

## Phase 1
Google Spreadsheet + AI Chat

```
Google Spreadsheet
        │
Apps Script
        │
OpenAI
```

目的

・現場データをAIが理解できることを確認する

Status

✅ Completed

---

## Phase 2

Knowledge Database

```
Apps Script
        │
Supabase
        │
Knowledge Database
```

目的

Google Spreadsheet依存から脱却する。

ObservationをKnowledge Databaseへ蓄積する。

Status

✅ Supabase接続完了

---

# Next Phase

## CSV Import Engine

```
CSV

      │

CSV Parser

      │

Observation Mapping

      │

Knowledge Model

      │

Supabase
```

目的

CSVをKnowledgeへ変換する。

Observationを標準構造へ統一する。

Priority

★★★★★

---

## Observation Parser

CSV

↓

Event

↓

Item

↓

Attribute

↓

Value

↓

Context

CSVをそのまま保存しない。

Observationへ変換する。

---

## Knowledge Database

```
Facility

Users

Staff

Events

Event Values

Knowledge

Dictionary
```

Knowledge First

Observation First

Reality First

---

## AI Knowledge Engine

```
Question

↓

Knowledge Search

↓

Supabase

↓

Relevant Context

↓

OpenAI

↓

Answer
```

AIはDatabaseを読むのではない。

Knowledgeを読む。

---

## Future Data Sources

Observation Source

・CSV

・MySQL API

・Google Workspace

・Google Forms

・Web

・Mobile

・Voice

・IoT

・Medical Device

・Sensor

すべてObservationとして統一する。

---

## Long Term Vision

```
Human

Sensor

IoT

Medical Device

Facility System

Voice

Google Workspace

CSV

        │

        ▼

Observation Layer

        │

Knowledge Model

        │

RISEN Knowledge Database

        │

Knowledge Search Engine

        │

AI

Analytics

BI

Dashboard

Document

Monitoring
```

---

# Goal

RISENはAIチャットを作るプロジェクトではない。

施設のObservationをKnowledgeへ構造化し、

Knowledgeを施設の資産として未来へ継承する

Knowledge Engineering Platformを構築する。
