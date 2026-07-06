# 110 RISEN Architecture Principles

Version: 0.1

---

# Purpose

本書は、RISEN Knowledge OS の設計思想をまとめたものである。

RISENは単なる介護記録システムではない。

施設がKnowledgeを主体的に管理し、
未来へ継承するためのKnowledge Engineering Platformである。

---

# 1. Knowledge Ownership

施設で蓄積されるObservationとKnowledgeは、
施設自身の重要な資産である。

RISENはKnowledgeを特定システムへ閉じ込めない。

施設が主体的に管理・活用できる構造を提供する。

---

# 2. Data Ownership

データの主体は施設である。

システム会社ではない。

施設は自らのデータを自由に利用できるべきである。

RISENはそのための共通基盤を提供する。

---

# 3. Knowledge Continuity

システムは変わる。

AIも変わる。

クラウドも変わる。

しかし、

Knowledgeは残る。

RISENはKnowledgeの継続性を最優先とする。

---

# 4. Platform Independence

RISENは特定サービスに依存しない。

現在はSupabaseを利用する。

しかし、

Knowledge Model

Database Schema

Knowledge Dictionary

は標準技術で設計する。

必要に応じて

PostgreSQL

他クラウド

オンプレミス

へ移行可能とする。

---

# 5. Multi Facility Platform

RISENは施設ごとにシステムを作らない。

共通基盤を利用する。

各施設は

facility_id

によって独立管理される。

```
RISEN Platform

      facilities

            │

────────────────────────

たんぽぽ会

facility_id = 1

────────────────────────

いちごの里

facility_id = 2

────────────────────────

・・・
```

Knowledge Dictionaryは共通。

Observationは施設ごと。

Knowledgeは施設ごとに蓄積される。

---

# 6. Common Knowledge Base

施設ごとに記録方法は多少異なる。

しかし、

排泄

睡眠

食事

服薬

行動

など、

Observationの本質は共通している。

RISENでは

Knowledge Dictionary

Knowledge Model

Master

を共通化する。

---

# 7. Observation Source Independence

Observationは入力方法に依存しない。

Observation Source

・CSV

・MySQL API

・Google Sheets

・Web

・Mobile

・Voice

・Sensor

・IoT

・Medical Device

すべてObservationとして統一する。

---

# 8. Google Workspace Position

Google Workspaceは

Operational Layer

として利用する。

役割

・入力

・共有

・簡易集計

・現場運用

Knowledgeの保存先ではない。

KnowledgeはRISEN Databaseで管理する。

---

# 9. Supabase Position

Supabaseは

Knowledge Database

の実装基盤である。

RISENそのものではない。

Knowledge Modelを実装するためのDatabaseである。

---

# 10. AI Position

AIはKnowledgeを生成するものではない。

Knowledgeを活用する。

Knowledge Database

↓

Knowledge Search

↓

AI

↓

Answer

という構造を採用する。

AIチャットはKnowledge Engineの一機能である。

---

# Core Message

RISENは、

データを集めるシステムではない。

施設のObservationをKnowledgeへ構造化し、

施設自身のKnowledge資産として育て、

未来へ継承するKnowledge Engineering Platformである。
