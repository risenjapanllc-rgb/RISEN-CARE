# 202 Weather Service

Version: v1.0

---

# Purpose

Weather Service は、

Facility の所在地を基に

Observation の当日の気象情報を取得する

Environment Service である。

Weather は

Observation ではない。

Observation Context を構成する

Environment Context として利用する。

---

# Background

Observation は

利用者に起きた事実を表す。

しかし、

その事実を理解するためには

環境情報が必要となる。

例

- 天気
- 気温
- 湿度
- 気圧

Weather Service は

Facility を起点として

Observation に環境情報を提供する。

---

# Role

Weather Service は

Facility の所在地から

日付ごとの気象情報を取得する。

取得した情報は

Observation を変更せず、

Observation Context として利用する。

---

# Architecture

```text
Facility

↓

Latitude / Longitude

↓

Weather Service

↓

Daily Weather

↓

Observation Context

↓

Search Engine

↓

AI Chat

↓

Dashboard
```

---

# Core Principle

Weather は

Observation ではない。

Weather は

Observation に意味を与える

Environment Context である。

Observation を変更しない。

Environment Context を追加する。

---

# Input

Weather Service が利用する情報

- Facility
- Latitude
- Longitude
- Date

---

# Output

Daily Weather

推奨項目

```text
date

weather_code

weather_label

temperature_max

temperature_min

humidity

pressure

wind_speed

precipitation

sunrise

sunset
```

必要最小限で開始する。

---

# Initial Implementation

最初の実装では

以下のみ取得する。

```text
weather_label

temperature_max

temperature_min
```

Dashboard 表示例

```text
🌤 6月30日(火)

晴れ

最高29℃／最低22℃
```

---

# Facility Resolution

Weather は

Facility を利用して取得する。

```text
Resident

↓

Facility

↓

Latitude / Longitude

↓

Weather Service
```

---

# Date Resolution

Observation の日付を利用する。

```text
Observation

↓

Event Date

↓

Weather Service
```

Observation が存在しない日は

Dashboard の表示日に対応する。

---

# Weather Provider

Weather Service は

Provider を抽象化する。

例

- Open-Meteo
- OpenWeather
- 気象庁
- Private API

Provider は

将来的に変更可能とする。

---

# Daily Weather Cache

同一施設・同一日は

再取得しない。

```text
Facility

+

Date

↓

Daily Weather Cache
```

これにより

API 呼び出し回数を削減する。

---

# Weather Context

Observation Context に

以下を追加できる。

- Weather
- Temperature
- Humidity
- Pressure
- Wind
- Rain
- Heat Index

---

# AI Usage

AI は

Weather を

Observation Context として利用する。

例

```text
Observation

立ち上がれない

Environment Context

晴れ

最高29℃

Resident Understanding

暑さの影響も考慮して
水分摂取状況を確認してください。
```

原因は断定しない。

---

# Dashboard Usage

Dashboard は

日付ごとに

Weather を表示する。

例

```text
🌤 6月30日(火)

晴れ

最高29℃／最低22℃
```

---

# Search Engine Usage

Search Engine は

Observation と

Weather Context を

同時に検索できる。

例

```text
猛暑日に転倒した利用者
```

```text
Observation

+

Weather
```

---

# Explainability

AI は

Observation と

Weather を分けて説明する。

例

```text
Observation

立ち上がれない記録があります。

Environment Context

同日は最高29℃でした。

暑さとの関連も考慮してください。
```

Weather を

原因として断定しない。

---

# Security

Weather は

個人情報ではない。

Facility 単位で取得する。

利用者固有の情報とは分離して管理する。

---

# Future

将来的には

以下を追加する。

- Humidity
- Pressure
- Heat Index
- UV Index
- Air Quality
- Typhoon
- Snow
- Disaster Warning

---

# Design Principles

## Context First

Weather は

Environment Context である。

---

## Observation First

Observation を変更しない。

---

## Explainable

Observation と

Environment Context を

分けて説明する。

---

## Provider Independent

Weather Provider に依存しない。

---

## Minimal First

最初は

天気・最高気温・最低気温だけで開始する。

---

# Related Documents

- 201 Facility Model
- 203 Observation Context
- 194 Search Engine
- 195 AI Chat
- 196 Dashboard
