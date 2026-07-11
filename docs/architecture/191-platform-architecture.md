# 191 Platform Architecture

Version: v1.0

---

# Purpose

本書は RISEN CARE 全体のシステム構成を定義する。

Platformを構成する各レイヤーの責務と、

データの流れを明確にする。

---

# System Overview

```
Web Application

        │

        ▼

API Layer

        │

        ▼

Intelligence Engine

        │

        ▼

Search Engine

        │

        ▼

Supabase

        │

        ▼

OpenAI
```

---

# Architecture Layers

RISEN CARE は以下の6層で構成される。

```
Presentation

↓

Application

↓

Intelligence

↓

Search

↓

Data

↓

AI
```

---

# Presentation Layer

利用者へ情報を提供する画面。

構成

- Dashboard
- AI Chat
- Management
- Analytics
- Executive Dashboard
- Mobile（Future）
- Family Portal（Future）

Presentation Layer は

データを保持しない。

---

# Application Layer

画面と Intelligence Engine を接続する。

役割

- API
- 認証
- Routing
- UI Logic
- Dashboard Logic
- Chat Logic

---

# Intelligence Layer

Observation を利用者理解へ変換する。

構成

- Observation Intelligence
- Reasoning Engine
- Resident Memory
- Recommendation
- Prediction（Future）

Intelligence Layer は

RISEN CARE の頭脳である。

---

# Search Layer

必要な情報だけを取得する。

構成

- Resident Memory Search
- Observation Search
- Knowledge Search
- Episode Search
- Pattern Search
- Trigger Search
- Vector Search（Future）

Search Layer は

AI に渡す情報を決定する。

---

# Data Layer

すべてのデータを管理する。

主なデータ

- Users
- Daily Records
- Observations
- Events
- Knowledge
- Knowledge Relations
- Episodes
- Patterns
- Triggers
- Resident Memory
- Observation Intelligence Reports

Data Layer は

唯一のデータソースである。

---

# AI Layer

OpenAI を利用して

利用者理解を生成する。

AI の役割

- 利用者理解
- Explainable AI
- Chat
- Report Generation
- Recommendation

AI は

データを保存しない。

---

# Component Relationship

```
Dashboard

AI Chat

Management

Analytics

        │

        ▼

Application Layer

        │

        ▼

Intelligence Engine

        │

        ▼

Search Engine

        │

        ▼

Supabase

        │

        ▼

OpenAI
```

---

# Processing Flow

```
Daily Record

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

↓

Observation Intelligence

↓

Resident Memory

↓

Search Engine

↓

OpenAI

↓

Dashboard
AI Chat
Management
Analytics
```

---

# Design Principles

## Single Source of Truth

Observation が唯一の事実である。

---

## Explainable AI

AI は

根拠を説明できなければならない。

---

## Search First

AI は検索しない。

Search Engine が

必要な情報だけを取得する。

---

## Shared Intelligence

すべての画面は

同じ Intelligence Engine を利用する。

画面ごとに AI を持たない。

---

## Modular Architecture

各コンポーネントは

独立して進化できる。

Resident Memory

Search Engine

Dashboard

AI Chat

は互いに疎結合とする。

---

# External Services

現在利用する外部サービス

- Supabase
- OpenAI API

将来的に追加予定

- IoT
- Wearable Devices
- Medical Systems
- Care Plan Systems

---

# Future Architecture

将来的には

```
Facility Intelligence

↓

Regional Intelligence

↓

Care Intelligence Platform
```

へ拡張する。

---

# Related Documents

- 190 Care Intelligence Platform
- 192 Observation Pipeline
- 193 Resident Memory
- 194 Search Engine
- 195 AI Chat
- 196 Dashboard
- 197 Management Intelligence
- 198 Facility Intelligence
- 199 Roadmap
