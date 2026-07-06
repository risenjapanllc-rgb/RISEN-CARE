# 141 Database Schema

Version: 1.0

---

# Purpose

本書は、RISEN Knowledge Platform のデータベース設計を定義する。

RISENは単なるデータベースではない。

現場で発生したObservation（観察・記録・センサー情報・音声など）を
Knowledgeへ構造化し、施設の知的資産として未来へ継承するための基盤である。

---

# Design Philosophy

RISEN Databaseは以下の考え方に基づいて設計する。

```
Reality
    │
Observation
    │
Knowledge Structure
    │
Knowledge Database
    │
Knowledge Search
    │
AI
    │
Human
```

AIは主役ではない。

Knowledge Database が中心であり、
AIはKnowledgeを活用するエンジンである。

---

# Architecture

```
Human

Sensor

IoT

Medical Device

Facility System

Google Workspace

AppSheet

CSV

Voice

        │

        ▼

Observation Engine

        │

        ▼

RISEN Database

        │

        ▼

Knowledge Search

        │

        ▼

AI
```

---

# Core Data Model

```
Facility
    │
Users
    │
Events
    │
Event Values
    │
Knowledge
```

---

# Table : facilities

施設情報を管理する。

各施設は独自の facility_id を持ち、
施設自身がデータオーナーとなる。

主な項目

- id
- code
- name
- organization
- active
- created_at

---

# Table : users

利用者情報を管理する。

主な項目

- id
- facility_id
- user_code
- name
- kana
- birth_date
- gender
- active
- source_system
- source_record_id
- created_at
- updated_at

---

# Table : staff

職員情報を管理する。

主な項目

- id
- facility_id
- staff_code
- name
- role
- active

---

# Table : event_types

Knowledge Dictionary

RISENで扱うObservationの種類を定義する。

例

・睡眠

・食事

・排泄

・服薬

・受診

・リハビリ

・入浴

・行動

主な項目

- id
- category
- name
- sort_order
- active

---

# Table : events

Observationの骨格を管理する。

eventsは

「誰に」

「いつ」

「何が起きたか」

だけを管理する。

主な項目

- id
- facility_id
- user_id
- event_type_id
- staff_id
- event_datetime
- location
- summary
- memo
- source
- source_system
- source_record_id
- import_batch_id
- status
- created_at
- updated_at

---

# Table : event_values

Observationの詳細値を管理する。

eventsだけでは意味は完成しない。

詳細はevent_valuesへ保存する。

例

睡眠

↓

状態：熟睡

覚醒回数：2

場所：居室

眠りSCAN：Deep

排泄

↓

便性状：泥状

便量：中

失禁：なし

食事

↓

朝食：100%

昼食：70%

水分：1200ml

主な項目

- id
- event_id
- item
- value_text
- value_number
- unit
- datatype
- sequence
- created_at

---

# Table : knowledge

Observationから生成されたKnowledgeを保存する。

AIはKnowledgeを検索して回答する。

主な項目

- id
- facility_id
- event_id
- title
- content
- category
- tags
- status
- created_at
- updated_at

---

# Observation Engine

RISENでは入力方法を問わない。

対象となる入力

・Google Spreadsheet

・AppSheet

・CSV

・音声入力

・IoT

・Medical Device

・Sensor

・介護システム

すべてObservationとして扱う。

```
Observation

↓

Parser

↓

Knowledge Mapping

↓

events

↓

event_values

↓

Knowledge
```

---

# Design Principles

## Facility First

施設はデータオーナーである。

facility_id によって

利用者

イベント

Knowledge

を管理する。

---

## Observation First

RISENはCSVを保存するシステムではない。

ObservationをKnowledgeへ変換するシステムである。

---

## Knowledge First

AIはDatabaseを読むのではない。

Knowledgeを読む。

Knowledgeが施設の資産となる。

---

## Reality First

現場で起こったRealityを最優先する。

ObservationはRealityの記録である。

---

## Traceability

元データへ戻れることを保証する。

そのため

- source

- source_system

- source_record_id

- import_batch_id

を保持する。

---

# Data Ownership

RISENはベンダーがデータを所有しない。

施設がデータオーナーである。

施設は

いつでも

自施設のKnowledge Databaseを引き継ぐことができる。

これはRISENの重要な設計思想である。

---

# Long Term Vision

```
Human

Sensor

IoT

Medical Device

Facility System

Google Workspace

CSV

Voice

        │

        ▼

Observation Engine

        │

        ▼

RISEN Knowledge Database

        │

        ▼

Knowledge Search Engine

        │

        ▼

AI

Dashboard

Analytics

BI

Risk Detection

Decision Support

Knowledge Sharing
```

---

# Development Roadmap

Phase 1

Google Spreadsheet + AI Chat

✅ Completed

---

Phase 2

Supabase Knowledge Database

✅ Completed

---

Phase 3

CSV Import Engine

In Progress

---

Phase 4

Observation Engine

Planned

---

Phase 5

Knowledge Search Engine

Planned

---

Phase 6

AI Knowledge Platform

Planned

---

# Mission

RISENはAIチャットを作るプロジェクトではない。

施設で生まれるObservationをKnowledgeへ構造化し、

Knowledgeを施設の資産として未来へ継承する

Knowledge Engineering Platformを構築する。
