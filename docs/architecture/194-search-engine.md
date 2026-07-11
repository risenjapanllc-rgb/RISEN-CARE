# 194 Search Engine

Version: v2.0

---

# Purpose

Search Engine は、AI が利用者を理解するために必要な Observation を収集・整理し、最適なコンテキストを生成する。

AI は検索を行わない。

Search Engine が検索を担当し、AI は理解と推論に集中する。

---

# Role

Search Engine は RISEN CARE の Intelligence Platform において、

Observation と AI を接続する中核コンポーネントである。

目的は

- Observation を取りこぼさない
- AIへ必要最小限の情報だけ渡す
- 回答根拠を明確にする

ことである。

---

# Architecture

```text
Question

↓

Question Analysis

↓

Search Planner

↓

Structured Search

↓

Keyword Search

↓

Semantic Search

↓

Episode Expansion

↓

Result Ranking

↓

AI Context Builder

↓

OpenAI
```

---

# Search Pipeline

検索は以下の順序で実施する。

## Step 1

Question Analysis

質問から

- 利用者
- 期間
- カテゴリ
- 意図

を抽出する。

例

質問

「最近転倒した？」

↓

解析

- 利用者
- 期間：30日
- カテゴリ：転倒
- 意図：状態変化確認

---

## Step 2

Structured Search

Observation を構造条件で取得する。

対象

- 利用者
- 日付
- 期間
- Event Type
- Category

これは最も高速な検索である。

---

## Step 3

Keyword Search

Observation を全文検索する。

対象

- Summary
- Memo

関連語辞書を利用し、

表記ゆれも吸収する。

例

転倒

↓

- 倒れ込み
- 転ぶ
- 立ち上がれない
- 床に座り込む
- ふらつき

---

## Step 4

Semantic Search

意味的に近い Observation を取得する。

Embedding を利用し、

単語が一致しなくても

意味が近い Observation を取得する。

例

質問

「最近転倒した？」

Observation

「歩行器を押しながら居室まで誘導」

AI は

転倒リスクに関連する Observation と判断できる。

---

## Step 5

Episode Expansion

検索で取得した Observation の前後を取得する。

Observation は単独ではなく、

Episode として理解する。

例

```text
09:34 食事

↓

09:41 興奮

↓

09:41 倒れ込み

↓

09:45 居室誘導

↓

09:50 バイタル
```

AI は Episode 全体を理解する。

---

## Step 6

Result Ranking

検索結果を順位付けする。

評価項目

- Semantic Score
- Keyword Score
- Category Score
- Time Distance
- Episode Score

関連度の高い Observation を優先する。

---

## Step 7

AI Context Builder

AIへ渡す情報を構築する。

入力

- Resident Memory
- Observation
- Episode
- Pattern
- Knowledge

不要な Observation は渡さない。

---

## Step 8

OpenAI

AI は

Search Engine が生成した Context のみを利用して回答する。

---

# AI Input Optimization

AIへ渡す目安

- Resident Memory：1件
- Observation：20件以内
- Episode：5件以内
- Pattern：5件以内
- Knowledge：必要最小限

Observation 全件は渡さない。

---

# Search Principles

## Search First

検索を先に行う。

AI は検索を担当しない。

---

## High Recall

重要な Observation を取りこぼさないことを最優先とする。

多少候補が多くても、

重要な Observation を失わない。

---

## High Precision

関連性の低い Observation を減らす。

Ranking により

AIへ渡す Observation を最適化する。

---

## Episode First

Observation は単独では理解しない。

前後の Observation を含め、

Episode として扱う。

---

## Minimal Context

AIへ渡す情報は

必要最小限とする。

---

## Explainable

AI回答は

検索された Observation を根拠とする。

回答から Observation まで追跡できる。

---

## Scalable

Observation が

10件でも

100万件でも

同じ検索方式で動作する。

AIへ渡す情報量は一定である。

---

# Search Planner

Search Planner は

質問内容に応じて

検索戦略を決定する。

例

質問

「去年の夏は？」

↓

期間検索

↓

Episode Search

↓

Comparison

質問

「最近転倒した？」

↓

Structured Search

↓

Keyword Search

↓

Semantic Search

↓

Episode Expansion

---

# Future

今後追加予定

- Hybrid Search
- Vector Search
- Semantic Search
- Knowledge Search
- Similar Episode Search
- Similar Resident Search
- Facility Intelligence Search
- Organization Intelligence Search
- Predictive Search

---

# Design Principles

Search Engine は

AI のための検索エンジンではない。

利用者理解を生成するための

Context Engine である。

検索結果ではなく、

理解可能な Context を生成することが目的である。

---

# Related Documents

- 190 Care Intelligence Platform
- 191 Platform Architecture
- 192 Observation Pipeline
- 193 Resident Memory
- 195 AI Chat
