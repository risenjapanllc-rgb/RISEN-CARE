# 100 System Setup

Version: v1.0

---

# Purpose

本書は、RISEN CARE を新しい環境へ構築するための初期セットアップ手順を定義する。

対象読者

- 開発者
- システム管理者
- 新規プロジェクト参加者

本書に従うことで、RISEN CARE の開発環境をゼロから構築できることを目的とする。

---

# Prerequisites

以下を準備する。

- Google Account
- Google Spreadsheet
- Google Apps Script
- Supabase Project
- OpenAI API Key
- GitHub Repository

---

# System Overview

RISEN CARE は Observation First Architecture を採用する。

```text
Google Spreadsheet

↓

Google Apps Script

↓

Supabase

↓

Knowledge Platform

↓

Observation Intelligence

↓

Resident Memory

↓

Dashboard
```

---

# Step 1

## Create Supabase Project

Supabaseで新しいProjectを作成する。

取得する情報

```text
Project URL

anon key

service_role key
```

---

# Step 2

## Create Database

Supabase SQL Editor を開く。

以下を実行する。

```text
sql/schema/001-schema.sql
```

全テーブルが作成されることを確認する。

---

# Step 3

## Import Master Data

以下を順番に実行する。

```text
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

Master Data が正常に登録されることを確認する。

---

# Step 4

## Configure Google Apps Script

Apps Script の Script Properties を設定する。

```text
SUPABASE_URL

SUPABASE_ANON_KEY

OPENAI_API_KEY

SPREADSHEET_DAILY

SPREADSHEET_MASTER
```

必要に応じて追加する。

```text
SUPABASE_SERVICE_ROLE_KEY
```

API Key はコードへ直接書かない。

---

# Step 5

## Deploy Google Apps Script

主要な同期処理

```text
syncUsersToSupabase()

syncDailyRecordsToSupabase()

detectEventType()

getEventMapper()

getEventMapperCache()

checkUnmappedEvents()
```

正常に保存されることを確認する。

---

# Step 6

## First Synchronization

以下の順番で実行する。

```text
syncUsersToSupabase()

↓

syncDailyRecordsToSupabase()
```

確認項目

```text
users

events

daily_records
```

へデータが登録されること。

---

# Step 7

## Event Mapper

未分類Observationを抽出する。

```text
checkUnmappedEvents()
```

抽出されたObservationを

```text
event_mapper
```

へ追加する。

コードは変更しない。

Master を育てる。

---

# Step 8

## Knowledge Generation

Observation は自動的に

```text
Observation

↓

Event Type

↓

Knowledge
```

へ変換される。

Knowledge は Observation Intelligence の基盤となる。

---

# Step 9

## Review

Review を自動生成する。

例

- 事故レビュー
- 医療レビュー
- 権利擁護レビュー
- 委員会レビュー

1つのObservationは複数Reviewへ関連付け可能である。

---

# Step 10

## Observation Intelligence

Observation Intelligence を実行する。

```text
runObservationIntelligenceV2(userId)
```

処理

```text
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
```

Resident Memory が更新されることを確認する。

---

# Step 11

## Dashboard

Dashboard を起動する。

確認項目

- 利用者表示
- Current Status
- Resident Summary
- Watch Points
- Important Patterns
- Recent Observations

Resident Memory が表示されることを確認する。

---

# Step 12

## Resident AI Chat

Resident AI Chat を実行する。

質問例

```text
最近変わったことはありますか？
```

確認項目

- Resident Memory取得
- Observation取得
- AI回答
- Observation根拠

---

# Verification Checklist

## Database

```text
users

events

daily_records

event_categories

event_types

event_mapper

review_types

event_type_review_types

knowledge_categories

knowledge_nodes

knowledge_relations

event_type_knowledge

resident_memory
```

---

## Master

- Event Categories
- Event Types
- Review Types
- Knowledge Categories
- Knowledge Nodes
- Knowledge Relations

---

## GAS

- Users Sync
- Daily Records Sync
- Event Mapper
- Unmapped Check
- Observation Intelligence
- Resident AI Chat

---

## Intelligence

正常に生成されること。

- Observation
- Knowledge
- Episode
- Pattern
- Trigger
- Resident Memory

---

## Dashboard

正常に表示されること。

- Current Status
- Resident Summary
- Watch Points
- Important Patterns
- Recent Observations

---

# Operational Policy

RISEN CARE では

Observation を唯一の Source of Truth とする。

施設差は Event Mapper で吸収する。

行政差は Review で吸収する。

Knowledge が Observation に意味を与える。

Observation Intelligence が利用者理解を生成する。

Resident Memory が現在の利用者理解を保持する。

Dashboard と AI Chat は Resident Memory を利用する。

---

# Completion Criteria

以下を満たした時点で、RISEN CARE の初期セットアップは完了とする。

- Supabase構築完了
- Database構築完了
- Master登録完了
- GAS設定完了
- データ同期完了
- Knowledge生成確認
- Observation Intelligence実行成功
- Resident Memory更新成功
- Dashboard表示成功
- Resident AI Chat動作確認
