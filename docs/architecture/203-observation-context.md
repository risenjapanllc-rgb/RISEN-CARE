# 203 Observation Context

Version: v1.0

---

# Purpose

Observation Context は、

Observation に

環境・時間・利用者背景などの

Context を付与し、

Observation の意味をより正確に理解するための

基盤モデルである。

Observation は変更しない。

Context を追加することで

利用者理解を深める。

---

# Background

Observation は

利用者に起きた事実である。

しかし、

Observation だけでは

十分に理解できない場合がある。

例

```text
Observation

立ち上がれない
```

だけでは、

理由は分からない。

しかし、

```text
Observation

立ち上がれない

+

猛暑日

+

食事量低下

+

水分摂取不足
```

となることで、

支援者は

より適切な視点で

Observation を理解できる。

---

# Role

Observation Context は、

Observation を補完する

Context を統合する。

Context は

Observation を変更しない。

Observation に

意味を与える。

---

# Architecture

```text
Observation

+

Context

↓

Observation Context

↓

Search Engine

↓

Reasoning Engine

↓

Resident Intelligence
```

---

# Core Principle

Observation は

唯一の事実（Fact）である。

Context は

Observation に意味を与える。

Observation は

変更しない。

Context を追加する。

---

# Context Layers

Observation Context は

複数の Context を統合する。

```text
Observation

├ Facility Context
├ Weather Context
├ Time Context
├ Season Context
├ Resident Context
├ Episode Context
├ Pattern Context
├ Trigger Context
└ Knowledge Context
```

---

# Facility Context

Facility Model により

取得される。

例

- Facility
- Region
- Time Zone

---

# Weather Context

Weather Service により

取得される。

例

- Weather
- Temperature
- Humidity
- Pressure
- Heat Index

---

# Time Context

Observation が

いつ発生したかを表す。

例

- Morning
- Afternoon
- Evening
- Night
- Weekday
- Holiday

---

# Season Context

例

- Spring
- Summer
- Autumn
- Winter

季節特有の変化を

理解する。

---

# Resident Context

Resident Memory により

取得される。

例

- Life History
- Preferences
- Communication
- Care Needs

---

# Episode Context

Observation が

どの Episode に属するかを示す。

例

```text
転倒前

↓

転倒

↓

受診

↓

経過観察
```

---

# Pattern Context

継続している

Observation Pattern を示す。

例

- 夜間覚醒
- 食欲低下
- 水分不足
- 排泄リズム

---

# Trigger Context

状態変化の

きっかけとなる

Observation を示す。

例

- 発熱
- 環境変化
- 家族面会
- 外出

---

# Knowledge Context

Knowledge Graph により

補完される。

例

```text
立ち上がれない

↓

移動困難

↓

転倒リスク
```

---

# Observation Context Flow

```text
Observation

↓

Facility Context

↓

Weather Context

↓

Time Context

↓

Resident Context

↓

Episode

↓

Pattern

↓

Trigger

↓

Knowledge

↓

Observation Context
```

---

# AI Usage

AI は

Observation Context を利用して

利用者理解を支援する。

例

```text
Observation

床に座り込んでいる

Facility

いちごの里

Weather

晴れ

29℃

Resident Memory

歩行器使用

↓

Resident Understanding
```

---

# Search Engine Usage

Search Engine は

Observation と

Context を

同時に取得する。

```text
Question

↓

Search Context

↓

Observation

+

Observation Context

↓

Prompt Builder

↓

OpenAI
```

---

# Dashboard Usage

Dashboard は

Observation Context を

利用して表示する。

例

```text
🌤 6月30日(火)

晴れ

最高29℃／最低22℃
```

---

# Explainability

AI は

Observation と

Context を分けて説明する。

例

```text
Observation

立ち上がれない記録があります。

Context

最高29℃でした。

Resident Memory

歩行器を使用しています。
```

Observation に存在しない事実は

生成しない。

---

# Context Priority

Context は

以下の優先順位で利用する。

```text
Resident

↓

Facility

↓

Weather

↓

Time

↓

Episode

↓

Pattern

↓

Trigger

↓

Knowledge
```

---

# Search Optimization

Search Engine は

質問内容に応じて

必要な Context のみ取得する。

例

```text
最近転倒した？

↓

Observation

Pattern

Trigger

Resident Memory
```

Weather は

不要であれば取得しない。

---

# Design Principles

## Observation First

Observation を変更しない。

---

## Context Gives Meaning

Context は

Observation に意味を与える。

---

## Explainable

Observation と

Context を区別する。

---

## Minimal Context

必要最小限の

Context のみ取得する。

---

## Scalable

新しい Context を

容易に追加できる。

---

# Future

将来的には

以下を追加する。

- Medication Context
- Family Context
- Environment Context
- IoT Context
- Wearable Context
- Medical Context
- Nursing Context
- Rehabilitation Context
- Community Context

---

# Philosophy

Observation は

事実を記録する。

Context は

その事実に意味を与える。

AI は

Observation と Context を統合し、

利用者理解を支援する。

Observation を変えず、

Context を積み重ねることで、

RISEN CARE は

継続的に Intelligence を進化させる。

---

# Related Documents

- 201 Facility Model
- 202 Weather Service
- 193 Resident Memory
- 194 Search Engine
- 195 AI Chat
- 196 Dashboard
- 197 Management Intelligence
- 198 Facility Intelligence
- 199 Roadmap

---

# Philosophy

Observation は

事実を記録する。

Context は

その事実に意味を与える。

Intelligence は

Observation と Context を統合し、

利用者理解を支援する。

Observation を変更せず、

Context を積み重ねることで、

RISEN CARE は

継続的に Intelligence を進化させる。
