# 180 RISEN Intelligence API

Version: v1.0

---

# Purpose

RISEN Intelligence API は、RISEN CARE の知能基盤である。

Dashboard、AIチャット、管理画面、将来のモバイルアプリは、
すべて同じ Intelligence API を利用する。

目的はAIを使うことではなく、

「必要な情報へ、必要な時に、最短で到達すること」

である。

---

# Vision

職員は

探す

のではなく

聞く

だけでよい。

管理者は

分析する

のではなく

判断できる。

理事長は

情報を集める

のではなく

経営に集中できる。

---

# Architecture

```
Daily Record
        │
Observation
        │
Knowledge
        │
Episode
        │
Pattern
        │
Reasoning
        │
RISEN Intelligence API
      ├──────────────┐
      │              │
 Dashboard         AI Chat
      │              │
 Management      Future Apps
```

---

# Core Principle

すべての画面は Intelligence API を利用する。

画面ごとにAIを作らない。

DashboardもChatも同じ知能を利用する。

---

# API

## POST /dashboard

現在の利用者を理解する。

### Input

```
user_id
```

### Output

```
状態

利用者理解

観察ポイント

根拠

最新Observation
```

---

## POST /ask

利用者へ自然文で質問する。

### Input

```
user_id

question
```

### Example

```
3年前に転倒したことは？

最近夜間覚醒は増えている？

便秘が続いたことは？

服薬変更後どう変化した？
```

### Output

```
回答

根拠

Observation

Episode

Knowledge

Confidence
```

---

## POST /timeline

利用者の時系列を取得する。

### Input

```
user_id

期間
```

### Output

```
Timeline
```

例

```
今日

昨日

先週

3年前
```

---

## POST /search

条件検索。

### Search Targets

Observation

Knowledge

Episode

Pattern

Review

Event

Daily Record

---

## POST /reasoning

AIによる推論。

入力

Observation

Knowledge

Episode

Pattern

出力

現在の状態

注意点

今後の支援提案

---

# Dashboard

Dashboardは

「今」

を見る画面である。

表示するもの

・現在の状態

・利用者理解

・観察ポイント

・最近の日常記録

---

# AI Chat

Chatは

「過去」

を検索する画面である。

例

```
去年の夏はどうだった？

3年前の転倒は？

最近食欲は落ちている？

夜間覚醒は増えている？
```

---

# Future

将来的には

AIはObservationだけではなく

Knowledge

Pattern

Episode

Review

Family

Care Plan

Medical

すべてを横断して回答する。

---

# Design Principle

情報を並べない。

必要な情報だけ返す。

AIは検索ではなく理解を支援する。

---

# Goal

RISEN CARE の目的は

「探す」

から

「聞く」

への転換である。

利用者理解を最短で支援する Intelligence Platform を実現する。
