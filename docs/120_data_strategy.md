# 120 Data Strategy

Version: 0.1

---

# Purpose

本書は、RISEN Knowledge OSにおけるデータ戦略を定義する。

RISENはデータを保存するためのシステムではない。

施設で日々蓄積されるObservationをKnowledgeへ構造化し、
組織の共有資産として育て、
未来へ継承するためのKnowledge Engineering Platformである。

---

# Why Data Strategy

介護・福祉施設では毎日多くの情報が記録されている。

・支援記録

・睡眠

・排泄

・食事

・バイタル

・行動

・受診

・加算

しかし、

多くのデータは業務システム内に保存されるだけで、

Knowledgeとして十分活用されていない。

RISENはこの課題を解決するための共通基盤である。

---

# Data Ownership

施設が記録したObservationは、

施設自身が主体的に管理・活用すべき資産である。

RISENは施設のデータを預かるのではなく、

施設が自らのKnowledgeを管理するための基盤を提供する。

---

# Knowledge Ownership

Observationは保存するだけでは価値にならない。

Observationを構造化し、

Knowledgeとして蓄積することで、

施設の経験は組織のKnowledge資産となる。

Knowledgeの所有者は施設である。

---

# Knowledge Continuity

システムは更新される。

AIも進化する。

クラウドも変わる。

しかし、

Knowledgeは残る。

RISENはKnowledgeの継続性を最優先とする。

施設が長年蓄積したKnowledgeは、

将来のシステム変更後も継承できることを前提とする。

---

# Platform Independence

RISENは特定のクラウドサービスに依存しない。

現在はSupabaseを採用する。

しかし、

Knowledge Dictionary

Knowledge Model

Database Schema

を標準技術で設計することで、

必要に応じて他の環境へ移行できる。

RISENの価値はクラウドではなく、

Knowledgeにある。

---

# Multi Facility Strategy

RISENは施設ごとに独立したKnowledgeを管理する。

```
                RISEN Knowledge Platform

        ┌──────────┼──────────┐
        │          │          │
        ▼          ▼          ▼

     Facility A  Facility B  Facility C

     Knowledge   Knowledge   Knowledge
       Asset       Asset       Asset
```

各施設は

facility_id

によって独立管理される。

Knowledgeの所有者は各施設である。

RISENは共通基盤を提供する。

---

# Common Knowledge Model

施設ごとに運用は異なる。

しかし、

排泄

睡眠

食事

服薬

行動

など、

Observationの本質は共通している。

RISENでは、

Knowledge Dictionary

Knowledge Model

Master Data

を共通化する。

これにより、

施設ごとの独自性を保ちながら、

Knowledgeを共有できる。

---

# Observation Source Independence

Observationは入力方法に依存しない。

Observation Source

・介護システム

・CSV

・MySQL API

・Google Spreadsheet

・Google Forms

・Web

・Mobile

・Voice

・IoT

・Medical Device

・Sensor

すべて同じObservationとして扱う。

---

# Data Integration

RISENは入力元を統合する。

```
CSV

Google Spreadsheet

MySQL API

Web

Voice

Sensor

Medical Device

        │

        ▼

Observation Layer

        ▼

Knowledge Model

        ▼

Knowledge Database
```

入力方法は変わっても、

Knowledge構造は変わらない。

---

# Risk Management

RISENはベンダーロックインを前提としない。

Knowledgeは施設の資産であり、

特定システムに依存しない。

必要に応じて

・Database

・クラウド

・アプリケーション

を変更できる設計とする。

---

# Future Vision

RISENは

介護システムを置き換えるものではない。

施設全体のKnowledge Platformとなる。

Google Workspace

介護システム

AI

IoT

センサー

医療機器

すべてをKnowledgeでつなぐ。

---

# Core Principles

Reality First

Observation First

Knowledge First

Facility First

Platform Independent

Human Centered

AI Assisted

Continuous Learning

---

# Core Message

RISENはデータを集めるシステムではない。

施設のObservationを理解し、

Knowledgeへ構造化し、

施設自身のKnowledge資産として育て、

未来へ継承するKnowledge Engineering Platformである。

施設が守るべきものは、

ソフトウェアではない。

Knowledgeである。
