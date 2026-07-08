# 010 Implementation Guide

Version: v0.2

---

# Purpose

本書はRISEN Knowledge OSを新しい環境へ構築するための実装手順をまとめたものである。

対象読者

- 開発者
- 管理者
- 新規プロジェクト参加者

本書に従うことで、RISENをゼロから構築できることを目的とする。

---

# System Overview

RISENはObservation First Architectureを採用する。

```
Google Spreadsheet
        ↓
Google Apps Script
        ↓
Supabase
        ↓
Knowledge Platform
        ↓
AI Reasoning
        ↓
Dashboard
```

---

# Step 1

## Create Supabase Project

Supabaseで新しいProjectを作成する。

取得する情報

- Project URL
- anon key
- service_role key

---

# Step 2

## Create Database

Supabase SQL Editorを開く。

以下を実行する。

```
sql/schema/001-schema.sql
```

全テーブルが作成されることを確認する。

---

# Step 3

## Import Master Data

以下の順番で実行する。

```
sql/master/

001-event-categories.sql

002-event-types.sql

003-review-types.sql

004-event-type-review-types.sql

005-knowledge-categories.sql

006-knowledge-nodes.sql

007-knowledge-relations.sql

008-event-type-knowledge.sql
```

---

# Step 4

## Configure GAS

Script Propertiesへ以下を設定する。

```
SUPABASE_URL

SUPABASE_KEY

SPREADSHEET_DAILY

SPREADSHEET_MASTER
```

---

# Step 5

## Deploy GAS

主要関数

```
syncUsersToSupabase()

syncDailyRecordsToSupabase()

detectEventType()

getEventMapper()

getEventMapperCache()

checkUnmappedEvents()
```

---

# Step 6

## First Synchronization

実行順

```
syncUsersToSupabase()

↓

syncDailyRecordsToSupabase()
```

確認項目

- users
- events

へデータが登録されること。

---

# Step 7

## Event Mapper

Mapperに存在しないObservationを抽出する。

```
checkUnmappedEvents()
```

抽出されたObservationを

```
event_mapper
```

へ追加する。

コードは変更しない。

Masterを育てる。

---

# Step 8

## Knowledge

Observationは自動的に

```
Observation

↓

Event Type

↓

Knowledge
```

へ変換される。

KnowledgeはAIの入力となる。

---

# Step 9

## Review

ReviewはObservationから自動判定される。

初期Review

- 事故レビュー
- 医療レビュー
- 権利擁護レビュー
- 委員会レビュー

1つのObservationは複数Reviewへ関連付け可能である。

---

# Step 10

## AI

AIは文章を直接解析しない。

```
Observation

↓

Knowledge Graph

↓

Reasoning

↓

Recommendation
```

Knowledge Graphを経由して推論する。

---

# Step 11

## Dashboard

Dashboardでは以下を可視化する。

- Observation
- Review
- Knowledge
- Recommendation

---

# Verification Checklist

Database

- users
- events
- event_categories
- event_types
- event_mapper
- review_types
- event_type_review_types
- knowledge_categories
- knowledge_nodes
- knowledge_relations
- event_type_knowledge

Master

- Event Categories
- Event Types
- Review Types
- Knowledge Categories
- Knowledge Nodes
- Knowledge Relations

GAS

- Users Sync
- Daily Records Sync
- Mapper
- Unmapped Check

System

- Observation
- Knowledge
- Review
- AI

すべて正常に動作すること。

---

# Operational Policy

RISENではコードよりMasterを育てる。

施設差はEvent Mapperで吸収する。

行政差はReviewで吸収する。

Knowledgeで意味を定義する。

AIはKnowledgeを入力として推論する。

Observation First Architectureを維持する。

---

# Completion Criteria

以下を満たした時点でRISEN v0.2の構築完了とする。

- Supabase構築完了
- Master登録完了
- GAS同期完了
- Observation登録完了
- Event Mapper運用開始
- Knowledge Platform稼働
- AI接続準備完了
