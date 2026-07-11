# 190 Care Intelligence Platform

Version: v2.0

---

# Purpose

RISEN CARE は介護記録システムではない。

RISEN CARE は **Care Intelligence Platform** である。

Observation（観察）から始まり、

利用者理解を深め、

現場・管理者・経営者の意思決定を支援する。

---

# Mission

介護の時間を

「記録」に使うのではなく

「利用者」に使う。

必要な情報へ

最短で到達できる知能基盤を実現する。

---

# Platform Architecture

```
Daily Records
        │
        ▼
 Observation Layer
        │
        ▼
 Knowledge Layer
        │
        ▼
 Intelligence Layer
        │
        ▼
 Search Engine
        │
        ▼
 Experience Layer
```

---

# Observation Layer

事実を蓄積する層。

主なデータ

- Daily Records
- Observations
- Events
- Users

Observation は RISEN CARE の唯一の事実である。

---

# Knowledge Layer

Observation に意味を与える。

主なデータ

- Knowledge Nodes
- Knowledge Relations
- Knowledge Categories
- Event Types

Observation は Knowledge へ変換される。

---

# Intelligence Layer

Knowledge を統合し、

利用者理解を生成する。

構成

- Observation Intelligence
- Reasoning Engine
- Resident Memory
- Recommendation
- Prediction（Future）

ここが RISEN CARE の頭脳である。

---

# Search Engine

Search Engine は

AI が読む情報を選択する。

AI は検索しない。

Search Engine が

- Resident Memory
- Observation
- Knowledge
- Episode
- Pattern
- Trigger

を選択し、

AI へ渡す。

これにより

- 高速
- 低コスト
- Explainable
- 長期データ対応

を実現する。

---

# Experience Layer

利用者ごとに最適な形で

情報を届ける。

画面

- Dashboard
- AI Chat
- Management Intelligence
- Analytics
- Executive Dashboard
- Family Portal（Future）
- Mobile（Future）

Experience Layer は

Intelligence Layer の結果を表示する。

---

# Core Components

## Observation Intelligence

```
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

Current Understanding

↓

Recommended Actions
```

---

## Resident Memory

利用者理解を継続的に蓄積する。

保存内容

- 現在の状態
- 利用者理解
- 支援時の配慮
- 最近の変化
- Important Episodes
- Watch Points

Resident Memory は

毎日の Observation Intelligence により更新される。

---

## AI Chat

AI Chat は

検索画面ではない。

利用者理解へ到達するための対話画面である。

質問例

- 最近変わったことは？
- 去年の夏は？
- 以前もあった？
- 夜間覚醒は？
- 食事量は？
- 転倒リスクは？
- 最近注意することは？

---

## Dashboard

Dashboard は

現在を見る画面である。

表示内容

- 現在の状態
- 利用者理解
- 観察ポイント
- Resident Memory
- Recent Observations
- AI Chat

---

## Management Intelligence

施設全体を見る。

例

- 転倒傾向
- 夜間支援
- 医療対応
- 事故分析
- 委員会資料
- 品質分析

---

## Executive Intelligence

理事長・経営層向け。

例

- 施設比較
- 品質指標
- 加算状況
- 事故推移
- 経営ダッシュボード

---

# Design Principle

すべての画面は

同じ Intelligence Engine を利用する。

画面ごとに AI を持たない。

AI は一つ。

UI は複数。

AI は検索しない。

Search Engine が必要な情報を選択する。

AI は渡された情報を理解し、

Explainable な回答を生成する。

---

# Data Flow

```
Daily Record

↓

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

↓

Search Engine

↓

Dashboard
AI Chat
Management Intelligence
Executive Intelligence
Analytics
```

---

# Detailed Design

このプラットフォームは以下の設計書で構成される。

- 191 Platform Architecture
- 192 Observation Pipeline
- 193 Resident Memory
- 194 Search Engine
- 195 AI Chat
- 196 Dashboard
- 197 Management Intelligence
- 198 Facility Intelligence
- 199 Roadmap

---

# Future

将来的には

- Care Plan
- Medical
- Family
- Life History
- Environment
- IoT
- Wearable

を統合する。

RISEN CARE は

介護記録システムから

Care Intelligence Platform

へ進化する。

---

# Success Criteria

職員は

「探す時間」より

「利用者と向き合う時間」が長い。

管理者は

分析より

意思決定に集中できる。

理事長は

施設全体の状態を

リアルタイムで理解できる。

---

# Vision

RISEN CARE は

Observation を

利用者理解へ変え、

利用者理解を

より良いケアへ変える。

すべての情報は

人を理解するために存在する。

AI は答えを押し付けるものではない。

人がより良い支援を行うための

知能基盤である。
