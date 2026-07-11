# 181 Observation Intelligence Engine

Version: v1.0

---

# Purpose

Observation Intelligence Engine は、RISEN CARE の推論エンジンである。

Observationを単純に要約するのではなく、

Observation
Knowledge
Episode
Pattern
Review

を統合し、

「利用者理解」

を生成することを目的とする。

---

# Philosophy

AIは文章を読むのではない。

意味を理解する。

Observationは事実である。

Knowledgeは意味である。

Episodeは文脈である。

Patternは変化である。

AIはそれらを統合して推論する。

---

# Inputs

Observation

Knowledge

Episode

Pattern

Review

User Profile

Care Plan（将来）

Medical Information（将来）

Family Information（将来）

---

# Reasoning Flow

Observation

↓

Knowledge

↓

Episode

↓

Pattern

↓

Current State

↓

Recommended Actions

↓

Evidence

↓

Confidence

---

# Outputs

Observation Intelligence Engine は
3種類の結果を生成する。

---

## 1 Dashboard

現在の利用者理解。

```json
{
  "status": {
    "label": "",
    "level": ""
  },
  "summary": "",
  "actions": [],
  "evidence": [],
  "confidence": ""
}
```

---

## 2 Report

人が読むレポート。

Markdown形式。

目的

・申し送り

・ケース会議

・記録確認

---

## 3 Chat Context

AIチャット用。

```json
{
  "episodes": [],
  "patterns": [],
  "knowledge": [],
  "important_events": [],
  "timeline": []
}
```

ChatはこのJSONを利用して回答する。

---

# Current State

AIはまず

現在どういう状態か

だけを判断する。

例

・身体状態は安定している

・排泄状況は継続観察が必要

・水分摂取量に注意

異常を断定しない。

Observationから判断可能な内容のみ出力する。

---

# Recommended Actions

AIは

次に何を見るべきか

を3〜5件提案する。

例

・バイタル確認を継続

・夜間排泄を観察

・水分摂取量を確認

・食事量を確認

---

# Evidence

AIは

必ず根拠を示す。

根拠には

Observation

Episode

Pattern

Knowledge

Review

を利用する。

推測だけを書かない。

---

# Confidence

AIは回答の確信度を返す。

high

medium

low

---

# Safety

Observationに存在しない事実を作らない。

診断をしない。

医療判断をしない。

原因を断定しない。

支援者の観察を支援する。

---

# Design Principle

Dashboard

Chat

Report

すべて同じ推論結果を利用する。

AIを画面ごとに作らない。

Observation Intelligence Engine を唯一の推論エンジンとする。

---

# Future

将来的には

Observation

Knowledge

Episode

Pattern

Review

Medical

Care Plan

Family

Life History

Environment

を統合した

Long-term Care Reasoning Engine

へ発展させる。

---

# Goal

Observation Intelligence Engine は

RISEN CARE の頭脳である。

利用者理解を支援し、

現場・管理者・経営者が

必要な情報へ最短で到達できる

知能基盤を実現する。
