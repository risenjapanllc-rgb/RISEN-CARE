# 006 RISEN System Architecture

Version: 0.1

Last Updated: 2026-07-03

---

# Purpose

本書は、RISEN Knowledge OS 全体のシステム構成を定義する。

RISENは単なる介護記録システムではない。

あらゆるObservation（観察）を統合し、
Knowledgeへ変換し、
AI・文書・分析・経営支援へ活用する
Knowledge Engineering Platformである。

---

# Architecture Overview

```
Reality
   │
   ▼
Observation Sources
──────────────────────────────────────

Human
Facility System
MySQL API
CSV Import
Google Drive
Google Sheets
Web Input
Mobile Input
Voice Input
Sensor
IoT Device
Medical Device

──────────────────────────────────────
              │
              ▼
      Observation Layer
              │
              ▼
     Knowledge Dictionary
              │
              ▼
      Knowledge Model
              │
              ▼
     Knowledge Database
              │
              ▼
      Knowledge Engine
              │
 ┌────────────┼───────────────┐
 ▼            ▼               ▼
AI Engine  Document Engine  Analytics
                              │
                              ▼
                    Billing / Audit / BI
```

---

# Architecture Layers

## 1. Reality

RISENが対象とするのはReality（現場）である。

Realityには、

・利用者

・職員

・設備

・環境

・出来事

すべてが含まれる。

---

## 2. Observation Sources

Realityは様々な方法で観察される。

Observation Sourceは入力方法であり、
Knowledgeそのものではない。

例

・人による記録

・施設システム

・CSV

・MySQL API

・Google Drive

・Google Sheets

・音声入力

・スマートフォン入力

・睡眠センサー

・離床センサー

・ウェアラブル

・医療機器

今後新しい入力方法が追加されても、
Observationとして統一して扱う。

---

## 3. Observation Layer

RISENでは、

すべての入力をObservationとして統一する。

入力形式は異なっても、

Observationの意味を統一することが重要である。

---

## 4. Knowledge Dictionary

Observationを理解するための共通辞書。

現場の暗黙知を構造化する。

Knowledge Dictionaryは、

RISENにおける唯一のSource of Truthである。

---

## 5. Knowledge Model

Knowledge Dictionaryを

AIとDatabaseが理解できる構造へ変換する。

例

Category

Event

Observation Target

Attribute

Value

Action

Context

---

## 6. Knowledge Database

Knowledge Modelを保存する。

Databaseは目的ではない。

Knowledgeを実装した結果である。

---

## 7. Knowledge Engine

Knowledgeを活用する中核エンジン。

役割

・Baseline Learning

・Change Detection

・Pattern Recognition

・Similarity Search

・Knowledge Generation

・AI Reasoning

---

## 8. Output

Knowledgeは様々な形で活用される。

・AI

・ケース記録

・個別支援計画

・モニタリング

・会議資料

・検索

・分析

・加算

・請求

・監査

・BI

---

# Core Principles

Reality First

Observation First

Knowledge Dictionary First

Knowledge Model First

Database Last

Everything is Connected

Human Centered

AI Assisted

Continuous Learning

---

# Future Expansion

RISENは入力方法に依存しない。

将来的には、

・IoT

・ウェアラブル

・見守りセンサー

・スマートホーム

・ロボット

・医療デバイス

などとも統合できる構造を持つ。

Architectureは変更せず、

Observation Sourceを追加するだけで拡張可能である。

---

# Core Message

RISENは、

データを集めるシステムではない。

RealityをObservationとして理解し、

Knowledgeへ構造化し、

AIと人が共に活用できるKnowledge Engineering Platformである。
