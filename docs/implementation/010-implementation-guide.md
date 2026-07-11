# 010 Implementation Guide

Version: v1.0

---

# Purpose

本ディレクトリは、RISEN CARE の実装仕様を管理する。

Architecture が「何を作るか」を定義するのに対し、

Implementation は「どのように実装するか」を定義する。

---

# Development Philosophy

RISEN CARE は

Observation First Architecture を採用する。

すべての実装は

Observation を起点として設計する。

```text
Observation

↓

Knowledge

↓

Observation Intelligence

↓

Resident Memory

↓

Search Engine

↓

Experience Layer
```

---

# Implementation Documents

## Foundation

### 020 Google Apps Script

実行基盤。

Google Spreadsheet、Supabase、OpenAI、Dashboard を接続する。

---

### 030 Supabase

データ基盤。

Observation、Knowledge、Resident Memory を管理する。

---

### 040 OpenAI

Reasoning Engine。

Observation Intelligence と AI Chat を生成する。

---

## Intelligence

### 050 Observation Intelligence

Observation を統合し、

利用者理解を生成する中核エンジン。

---

### 060 Resident Memory

利用者理解を継続的に保持する長期記憶。

Dashboard と AI Chat の基盤となる。

---

### 070 Search Engine

AI が必要な情報だけを取得する検索基盤。

大量データ環境でも高速・低コストな推論を実現する。

---

## Experience

### 080 Dashboard

現在の利用者状態を表示する画面。

Resident Memory を中心に表示する。

---

## Operations

### 090 Deployment

デプロイ、設定、運用、保守手順を定義する。

---

# Relationship with Architecture

Architecture

↓

Implementation

↓

Source Code

↓

Deployment

Architecture が設計思想を定義し、

Implementation が実装方法を定義する。

---

# Development Order

推奨する実装順序

```text
020 Google Apps Script

↓

030 Supabase

↓

040 OpenAI

↓

050 Observation Intelligence

↓

060 Resident Memory

↓

070 Search Engine

↓

080 Dashboard

↓

090 Deployment
```

---

# Naming Convention

Implementation Documents

```text
020-google-apps-script.md

030-supabase.md

040-openai.md

050-observation-intelligence.md

060-resident-memory.md

070-search-engine.md

080-dashboard.md

090-deployment.md
```

---

# Design Principles

- Observation First
- Structure before AI
- Knowledge before Reasoning
- Search before Prompt
- Explainable AI
- Human-centered Care
- Scalable Architecture
- Modular Implementation

---

# Related Documents

Architecture

```text
docs/architecture/
```

Implementation

```text
docs/implementation/
```

Roadmap

```text
docs/roadmap/
```

---

# Goal

Implementation Documents は、

RISEN CARE の実装方法を標準化し、

誰が開発しても同じ品質で実装できることを目標とする。
