# AIKO

## Evidence-Based Analytics AI

AIKOは介護・福祉向けのEvidence-Based Analytics AIである。

AIKOはLLMだけで回答を生成しない。

RISEN標準データモデルを根拠として、

* 検索
* 要約
* 集計
* 比較
* 傾向分析
* パターン分析
* 事前対応支援

を行い、職員の意思決定を支援する。

---

# Mission

> 根拠ある分析で、
> より良いケアの判断を支援する。

---

# Vision

AIKOは検索AIではない。

Observation IntelligenceからExplainable Intelligenceを生成するAnalytics AIである。

AIKOの価値は、記録を探すことではなく、記録を分析し、その結果を根拠付きで説明することにある。

---

# Design Philosophy

AIKOは以下の順序で動作する。

```text
Question

↓

Intent

↓

Analytics

↓

Evidence

↓

Answer
```

LLMは分析結果を勝手に作り出すものではない。

AIKOでは、可能な限り分析結果とEvidenceを先に確定し、その結果をLLMが理解しやすい自然言語で説明する。

---

# Core Principles

AIKOは以下の原則を守る。

* Evidence First
* Analytics before AI
* Structure before Reasoning
* AIKO derives understanding from facts and context.
* It never presents derived observations as facts.
* No Hallucination
* Explainable Answers
* Human-centered Decision Support

日本語では、次の考え方を基本とする。

> **AIKOは事実と文脈から理解を導出する。
> ただし、導出した内容を事実として扱わない。**

---

# What AIKO Does

AIKOは、記録を探すだけのAIではない。

記録を分析し、複数のObservationから意味のある傾向やパターンを導出し、その根拠を説明するAIである。

AIKOは以下を行う。

## Search

必要な記録を検索する。

## Summary

複数の記録を整理・要約する。

## Aggregation

平均、件数、回数、合計などを集計する。

## Comparison

期間、条件、状態などを比較する。

## Trend Analysis

時間の経過による変化を分析する。

## Pattern Analysis

複数のObservationから繰り返し現れる特徴やパターンを抽出する。

## Recommendation Support

分析結果をもとに、職員が事前対応を検討するための情報を提示する。

AIKOは最終判断を行わない。

---

# AIKO Analytics Maturity

AIKOの分析能力は段階的に発展する。

```text
Level 1
Search
検索

↓

Level 2
Summary & Aggregation
要約・集計

↓

Level 3
Comparison & Trend
比較・傾向分析

↓

Level 4
Pattern Discovery
パターン分析

↓

Level 5
Preventive Intelligence
事前対応支援
```

上位レベルは下位レベルの能力を利用する。

---

# AIKO Architecture

```text
Question

↓

Query Intent

↓

Analytics Engine

↓

Evidence Builder

↓

LLM

↓

Explainable Answer
```

AIKOは、LLM単独では回答を生成しない。

---

# Fact and Context

AIKOは、RISEN標準データに記録された事実と、その前後関係や複数記録から導出される理解を区別する。

```text
Observation

↓

Fact

↓

Context

↓

Derived Observation

↓

Pattern

↓

Evidence

↓

Answer
```

Factは記録から直接確認できる内容である。

Derived Observationは、FactとContextから合理的に導出された内容である。

AIKOはDerived ObservationをFactとして扱わない。

---

# Evidence First

すべてのAIKO回答は、可能な限りEvidenceへ遡れる構造とする。

```text
Answer

↓

Analysis Result

↓

Evidence

↓

Observation

↓

Source Data
```

利用者は、

「なぜその回答になったのか」

を後から確認できることを目標とする。

---

# Powered by RISEN CARE

RISEN CAREはObservation Intelligence Platformである。

AIKOはRISEN CAREが生成するObservation Intelligenceを利用して、分析・回答を行う。

```text
RISEN CARE

Observation

↓

Knowledge

↓

Episode

↓

Pattern

↓

Observation Intelligence

↓

AIKO

↓

Explainable Understanding

↓

Better Care
```

役割は次のように整理する。

```text
RISEN CARE
Observation → Intelligence

AIKO
Intelligence → Explainable Answer
```

AIKOはRISEN CAREの上で動作するAnalytics AIである。

---

# Relationship with RISEN CARE

RISEN CAREは、施設ごとのデータ構造や記録形式を吸収し、AIKOが利用できる標準化されたObservation Intelligenceを生成する。

AIKOは施設ごとのDB構造、CSV構造、マッピング処理を直接扱わない。

それらはRISEN CARE側の責務とする。

AIKOはRISEN標準データを前提として、

```text
Search
↓
Analytics
↓
Evidence
↓
Explainable Answer
```

を担当する。

---

# MVP

初期MVPでは以下の3つの分析ユースケースを実装する。

1. 1ヶ月の平均睡眠時間・途中覚醒回数
2. 興奮がなかった日の共通点
3. 興奮前の共通パターン

これらを通じて、

* Query Intent
* Analytics Engine
* Derived Observation
* Evidence Builder
* LLM Answer Generation

までの一連の処理を完成させる。

---

# Goal

AIKOの最終的な目的は、AIそのものを高度化することではない。

日々蓄積されるObservationを理解へ変換し、職員がより早く状況を把握し、より良い支援を検討できる状態をつくることである。

> **AIKO derives understanding from facts and context.**

> **It never presents derived observations as facts.**

> **From Evidence to Understanding.**
