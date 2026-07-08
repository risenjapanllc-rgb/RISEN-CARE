# RISEN Roadmap

Version: 0.1

Status: Active

---

# Vision

RISENは福祉・介護分野におけるObservation Platformを構築し、
ObservationからKnowledgeを生成し、
AIによる推論・提案・行政支援を実現することを目的とする。

---

# v0.1 Observation Foundation（Completed）

## Data Import

- [x] Google Spreadsheet連携
- [x] 利用者同期
- [x] イベント同期
- [x] Event Mapper
- [x] Event Types
- [x] Review Types

## Observation

- [x] Observation Model
- [x] Event分類
- [x] 行政レビュー分類
- [x] 未分類イベント検出

## Documentation

- [x] Observation Architecture

---

# v0.2 Knowledge Platform（Current）

## Master Data

- [ ] Locations
- [ ] Tags
- [ ] Risk Levels
- [ ] Symptoms
- [ ] Medications

## Knowledge

- [ ] Knowledge Model
- [ ] Knowledge Graph
- [ ] Observation Relations

## Review

- [ ] Review Workflow
- [ ] Review Dashboard
- [ ] Administrative Reports

---

# v0.3 AI

## AI Knowledge

- [ ] AI Mapper
- [ ] AI Classification
- [ ] AI Recommendation
- [ ] AI Risk Detection
- [ ] AI Summary

---

# v0.4 Dashboard

## User

- [ ] 利用者ダッシュボード
- [ ] タイムライン
- [ ] AI要約

## Facility

- [ ] KPI
- [ ] リスク分析
- [ ] イベント分析
- [ ] レビュー一覧

---

# v0.5 Administration

## Committee

- [ ] 身体拘束委員会
- [ ] 事故委員会
- [ ] 感染委員会
- [ ] 虐待防止委員会

## Reports

- [ ] 行政提出資料
- [ ] AIレビュー
- [ ] 月次レポート

---

# v1.0 RISEN Platform

```
Google Spreadsheet
介護ソフト
CSV
IoT
        │
        ▼
 Observation
        ▼
 Knowledge Graph
        ▼
 AI Reasoning
        ▼
 Recommendation
        ▼
 Dashboard
        ▼
 Administration
```

---

# Architecture Documents

| Document | Status |
|----------|--------|
| 001-risen-observation-architecture-v1.md | ✅ |
| 002-data-model.md | Planned |
| 003-knowledge-model.md | Planned |
| 004-review-model.md | Planned |
| 005-ai-reasoning.md | Planned |
| 006-import-architecture.md | Planned |
| 007-dashboard-architecture.md | Planned |
| 008-security-architecture.md | Planned |
| 009-roadmap.md | Active |

---

# Development Principles

RISENでは、すべての機能はObservationを中心に設計する。

```
Data

↓

Observation

↓

Knowledge

↓

AI

↓

Support

↓

Administration
```

新しい機能を追加する場合は、

**「Observationモデルにどのような価値を追加するか」**

を最初に検討する。

---

# Long-term Goal

RISENは、

Observationを中心に、

- 現場支援
- AI推論
- 行政対応
- 経営分析

を統合する福祉Knowledge Platformを目指す。
