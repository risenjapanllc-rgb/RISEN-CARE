# 190 Care Intelligence Platform

Version: v1.0

---

# Purpose

RISEN CARE は介護記録システムではない。

RISEN CARE は

Care Intelligence Platform

である。

Observation（観察）から始まり、

利用者理解を深め、

現場・管理者・経営者の意思決定を支援する。

---

# Mission

介護の時間を

記録に使うのではなく

利用者に使う。

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
 Experience Layer
```

---

# Observation Layer

事実を蓄積する層。

主なデータ

・Daily Records

・Observations

・Events

・Users

Observationは

RISEN CARE の唯一の事実である。

---

# Knowledge Layer

Observationに意味を与える。

主なデータ

・Knowledge

・Knowledge Relations

・Knowledge Categories

・Review

・Event Type

Observationは

Knowledgeへ変換される。

---

# Intelligence Layer

Knowledgeを統合して

利用者理解を生成する。

構成

・Observation Intelligence

・Reasoning Engine

・Resident Memory

・Recommendation

・Prediction（将来）

ここがRISEN CAREの頭脳である。

---

# Experience Layer

利用者ごとに最適な形で

情報を届ける。

画面

・Dashboard

・AI Chat

・Management

・Analytics

・Family Portal（将来）

・Mobile（将来）

Experience Layer は

Intelligence Layer の結果を表示するだけである。

---

# Core Components

## Observation Intelligence

Observation

↓

Knowledge

↓

Episode

↓

Pattern

↓

Current Understanding

↓

Recommended Actions

---

## Resident Memory

利用者理解を継続的に蓄積する。

内容

・現在の状態

・その人らしさ

・支援時の配慮

・最近の変化

・重要Episode

Resident Memory は

毎日のObservationから更新される。

---

## AI Chat

AI Chat は

検索画面ではない。

利用者理解へ到達するための対話画面である。

質問例

```
最近変わったことは？

去年の夏は？

以前もあった？

夜間覚醒は？

食事量は？
```

---

## Dashboard

Dashboard は

現在を見る画面である。

表示

・現在の状態

・利用者理解

・観察ポイント

・最近のObservation

・Resident Memory

---

## Management

施設全体を見る。

例

・転倒傾向

・夜間支援

・医療対応

・事故分析

・委員会資料

---

## Executive

理事長・経営層向け。

例

・施設比較

・事故推移

・加算状況

・品質指標

・経営ダッシュボード

---

# Design Principle

すべての画面は

同じ Intelligence Engine を利用する。

画面ごとにAIを持たない。

AIは一つ。

UIは複数。

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

Reasoning

↓

Resident Memory

↓

Dashboard
AI Chat
Management
Analytics
```

---

# Future

将来的には

Care Plan

Medical

Family

Life History

Environment

IoT

Wearable

を統合する。

RISEN CARE は

介護記録システムから

Care Intelligence Platform

へ進化する。

---

# Success Criteria

職員は

「探す」

時間より

「利用者と向き合う」

時間が長い。

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

AIは答えを押し付けるものではない。

人がより良い支援を行うための

知能基盤である。

---

# Philosophy

Observation is Fact.

Context gives Meaning.

Intelligence supports Understanding.

Observation は

利用者に起きた事実である。

Context は

Observation に意味を与える。

Intelligence は

Observation と Context を統合し、

利用者理解を支援する。
