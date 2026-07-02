# 002 Development Roadmap

## RISEN Knowledge OS

RISENは、現場の記録を知識へ変換するKnowledge OSを段階的に構築する。

Mission

> 理解から、価値をつくる。

---

# Phase1：Knowledge DB

知識を蓄積するためのデータ基盤を構築する。

## Components

- Supabase
- users
- case_records
- event_categories
- event_types
- event_items
- events
- event_values
- knowledge

---

# Phase2：Data Integration

あらゆる入力をRISEN形式へ統一する。

## Connector

- MySQL API
- CSV Import
- Google Drive
- Google Sheets

## Direct Input

- Web Input
- Mobile Input

## Voice Input（Future）

- Voice Input
- Speech to Text
- AI Correction

## Common Process

- Mapper
- Grouper
- Loader

---

# Phase3：AI Event Extraction

イベントを理解し、Knowledgeへ変換する。

## Functions

- Event Classification
- Summary
- Keyword Extraction
- Knowledge Generation

---

# Phase4：Knowledge Engine

蓄積されたKnowledgeを活用する。

## Functions

- Similar Case Search
- Pattern Analysis
- Knowledge Generation
- AI Reasoning

---

# Phase5：Document Engine

Knowledgeから文書を生成する。

## Output

- Case Record
- Monitoring
- Individual Support Plan
- Reports
- Meeting Documents

---

# Phase6：Release v1.0

RISEN Knowledge OS Release

---

# System Architecture

```text
                MySQL API
                     │
CSV Import ──────────┤
                     │
Google Drive ────────┤
                     │
Google Sheets ───────┤
                     │
Web Input ───────────┤
                     │
Mobile Input ────────┤
                     │
Voice Input ─────────┘
                     │
                     ▼
             Data Integration
                     │
        Mapper / Grouper / Loader
                     │
                     ▼
          RISEN Knowledge DB
                     │
                     ▼
         AI Event Extraction
                     │
                     ▼
           Knowledge Engine
                     │
                     ▼
           Document Engine
```

---

# Development Policy

RISENは入力方法に依存しない。

データが

- MySQL API
- CSV
- Web入力
- モバイル入力
- 音声入力

のいずれから取得された場合でも、RISEN内部では同一のイベント構造として管理する。

すべての入力は Data Integration を経由し、Mapper・Grouper・Loader によって標準化された後、Knowledge DBへ保存される。

Knowledge DBを中心とすることで、AI・検索・分析・文書生成は入力元を意識せず利用できる。

この設計思想により、RISENは特定システムに依存しないKnowledge OSとして発展していく。
