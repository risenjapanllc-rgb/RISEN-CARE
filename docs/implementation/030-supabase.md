# 030 Supabase

Version: v1.0

---

# Purpose

本書は、RISEN CARE における Supabase の設計と実装方針を定義する。

Supabase は RISEN CARE のデータ基盤であり、

Observation、Knowledge、Resident Memory、Observation Intelligence を永続化する。

---

# Role

Supabase は以下を担当する。

- データ保存
- データ検索
- 関係性管理
- RPC
- View
- AI Context提供
- Dashboardデータ提供

AI の推論は行わない。

---

# Architecture

```text
Google Apps Script

↓

Supabase REST API

↓

PostgreSQL

├── Tables
├── Views
├── Functions
└── RPC
```

---

# Database Layers

RISEN CARE は

以下のレイヤーで構成する。

```text
Master

↓

Observation

↓

Knowledge

↓

Intelligence

↓

Views

↓

RPC
```

---

# Master Data

施設共通マスタ

例

- event_categories
- event_types
- knowledge_categories
- knowledge_nodes
- knowledge_relations
- review_types

---

# Observation Data

Observation を保存する。

例

- users
- events
- daily_records
- event_mapper

Observation は

唯一の Source of Truth である。

---

# Knowledge Data

Observation に意味を与える。

例

- event_type_knowledge
- knowledge_nodes
- knowledge_relations

Knowledge Graph を構成する。

---

# Intelligence Data

AI が生成した理解を保存する。

例

- observation_reports
- comparison_reports
- resident_memory

Observation は変更しない。

Intelligence は更新される。

---

# Main Tables

主要テーブル

```text
users

events

daily_records

knowledge_nodes

knowledge_relations

event_type_knowledge

observation_reports

comparison_reports

resident_memory
```

---

# Resident Memory

Resident Memory は

現在の利用者理解を保持する。

主要項目

```text
user_id

summary

current_status

watch_points

support_preferences

important_patterns

recent_changes

confidence

generated_at

updated_at
```

更新方式

```text
UPSERT
```

Conflict Key

```text
user_id
```

---

# Observation Reports

Observation Intelligence の実行結果を保存する。

保存内容

- Prompt
- AI Output
- Dashboard Data
- Report Markdown
- Meta Information

履歴として保持する。

---

# Comparison Reports

期間比較結果を保存する。

例

- 前回比較
- 1週間比較
- 1か月比較
- 季節比較

---

# Views

Dashboard 用 View

例

```text
v_dashboard

v_recent_observations

v_resident_summary

v_management_dashboard
```

View は

表示用であり

更新しない。

---

# RPC

複雑な検索処理は

RPC で実行する。

例

```text
get_recent_events()

get_user_state()

search_observations()

get_dashboard()

get_resident_memory()

search_episode()

search_pattern()
```

---

# REST API

基本URL

```text
/rest/v1/
```

例

```text
/rest/v1/users

/rest/v1/events

/rest/v1/resident_memory
```

---

# Upsert

Resident Memory は

Upsert を利用する。

例

```text
POST

?on_conflict=user_id
```

Header

```text
Prefer

resolution=merge-duplicates

return=representation
```

---

# Search Strategy

検索は

Supabase 側で行う。

AI は検索しない。

検索対象

- Resident Memory
- Observation
- Knowledge
- Episode
- Pattern
- Trigger

---

# Search Context

質問から

検索条件を生成する。

例

```text
最近転倒した？

↓

期間

最近

↓

Category

転倒

↓

Observation Search
```

---

# Index Strategy

検索対象には

Index を設定する。

例

```text
user_id

event_datetime

event_type

knowledge_code

created_at
```

全文検索は

将来的に追加する。

---

# JSON Columns

以下は JSONB を利用する。

```text
current_status

watch_points

important_patterns

recent_changes

support_preferences
```

JSONB により

柔軟な構造を維持する。

---

# Relationships

主な関連

```text
users

↓

events

↓

event_type

↓

knowledge

↓

resident_memory
```

Observation を起点とする。

---

# Security

認証は

Supabase Authentication を利用する。

将来的に

Row Level Security を適用する。

利用者データは

アクセス権に応じて制御する。

---

# Performance

大量 Observation に対応する。

方針

- Index利用
- View利用
- RPC利用
- 必要データのみ取得
- AIへ全件渡さない

---

# Scalability

将来的には

数百万 Observation を想定する。

そのため

- Search Engine
- RPC
- View
- Index

を利用して

高速検索を実現する。

---

# Backup

定期バックアップを行う。

Observation は削除しない。

Resident Memory は

更新履歴を保持できる構造へ拡張可能とする。

---

# Future

追加予定

- pgvector
- Semantic Search
- Full Text Search
- Similar Resident Search
- Facility Search
- Multi Facility Search

---

# Operational Principles

Supabase は

RISEN CARE の唯一のデータ基盤である。

Observation を保持し、

Knowledge を保持し、

Resident Memory を保持する。

AI は

Supabase のデータを利用して

理解を生成する。

---

# Success Criteria

以下を満たす。

- Observation 保存
- Knowledge 保存
- Resident Memory 更新
- Observation Reports 保存
- Dashboard 表示
- AI Chat データ取得
- RPC 正常動作
- 高速検索
- Explainable Data Structure

---

# Related Documents

- `020-google-apps-script.md`
- `040-openai.md`
- `050-observation-intelligence.md`
- `060-resident-memory.md`
- `070-search-engine.md`
- `080-dashboard.md`
- `090-deployment.md`
