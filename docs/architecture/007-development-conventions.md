# 007 Development Conventions

Version: v0.2

---

# Purpose

本書はRISEN Knowledge OSの開発ルールを定義する。

設計・SQL・GAS・AIを含め、プロジェクト全体で統一された命名規則と開発方針を維持することを目的とする。

---

# Core Principles

RISENはObservation First Architectureを採用する。

```
Google Spreadsheet
        ↓
Observation (events)
        ↓
Event Type
        ↓
Knowledge
        ↓
Review
        ↓
AI Reasoning
        ↓
Dashboard
```

AIは文章ではなくObservationおよびKnowledgeを扱う。

---

# Development Principles

RISENではコードよりMasterを育てる。

施設ごとの差異はEvent Mapperで吸収する。

行政要件の違いはReviewで吸収する。

KnowledgeでObservationの意味を定義し、AIへ渡す。

新しい条件分岐(if文)は極力追加せず、Masterデータを更新して対応する。

---

# Naming Conventions

## Boolean

Boolean型は `active` を使用する。

使用例

```
active
```

使用しない

```
is_active
is_enabled
enable_flag
```

---

## DateTime

日時カラムは以下で統一する。

```
created_at
updated_at
```

---

## Code

コード値は `code` を使用する。

```
code
```

---

## Name

名称は `name` を使用する。

```
name
```

---

## Description

説明は `description` を使用する。

```
description
```

---

## Priority

優先順位は `priority` を使用する。

```
priority
```

数値が小さいほど優先順位が高い。

---

## Foreign Keys

外部キーは以下の命名で統一する。

```
user_id

event_type_id

review_type_id

knowledge_node_id

category_id
```

---

## Facility

施設固有データには `facility_name` を使用する。

```
facility_name
```

---

# Observation Design

Observationは事実を保存する。

例

```
歯磨き

就寝

廊下

トイレ

食事
```

Observationには意味を持たせない。

---

# Event Mapper

Mapperは施設ごとの表現を標準化する。

例

```
歯磨き

↓

清潔
```

```
就寝

↓

睡眠
```

```
廊下

↓

所在確認
```

Mapperを育てることでコードを変更せず対応する。

---

# Event Type

Event TypeはRISEN共通のObservation語彙とする。

例

```
睡眠

排泄

移動

所在確認

行動

食事

水分

服薬

清潔

入浴

事故

健康
```

---

# Knowledge

KnowledgeはObservationに意味を与える。

例

```
Observation

歯磨き

↓

Event Type

清潔

↓

Knowledge

口腔ケア

↓

ADL
```

KnowledgeはAI推論の入力となる。

---

# Review

Reviewは行政・運営上の判断を表す。

初期Review

```
事故レビュー

医療レビュー

権利擁護レビュー

委員会レビュー
```

1つのObservationは複数Reviewへ関連付け可能とする。

---

# AI Reasoning

AIは文章を直接解析しない。

```
Observation

↓

Knowledge

↓

Knowledge Relations

↓

Reasoning

↓

Recommendation
```

Knowledge Graphを経由して推論を行う。

---

# SQL Conventions

テーブル名は複数形とする。

例

```
users

events

event_types

knowledge_nodes
```

MasterデータはSeed SQLで管理する。

SchemaにはCREATE TABLEのみを記述する。

MigrationはSchema変更時のみ追加する。

---

# GAS Conventions

GASはObservationをSupabaseへ同期する。

Mapperを利用してEvent Typeを決定する。

Mapperに存在しないObservationは「その他」として登録し、`checkUnmappedEvents()`で抽出してMapperへ追加する。

---

# GitHub Structure

```
docs/
sql/
gas/
dashboard/
```

SQLは以下の構成で管理する。

```
sql/

schema/

master/

migration/

views/
```

---

# Development Policy

RISENは段階的にKnowledge Platformへ成長させる。

新しい機能を追加する前に、以下を必ず検討する。

1. Observationに新しい意味を追加する必要があるか。

2. Event Mapperで対応できないか。

3. Reviewで吸収できないか。

4. Knowledgeとして定義すべきではないか。

コード変更は最後の手段とする。

---

# Vision

RISENは介護・福祉分野におけるKnowledge Platformを目指す。

```
Observation
      ↓
Knowledge Graph
      ↓
AI Reasoning
      ↓
Recommendation
      ↓
Dashboard
      ↓
Administration
```

Observationを起点に知識を蓄積し、AIによる推論と意思決定支援を実現する。
