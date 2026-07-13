# 201 Facility Model

Version: v1.0

---

# Purpose

Facility Model は、

利用者・Observation・環境情報を

施設単位で正しく結び付けるための基盤モデルである。

RISEN CARE が

単一施設から多施設へ拡張しても、

同じ Intelligence Platform を利用できることを目的とする。


Facility は、

RISEN CARE 導入時に登録される

施設マスタである。

利用者・Observation・環境情報は、

Facility を起点として関連付けられる。

---

# Background

現在の Observation は、

主に利用者単位で管理されている。

しかし、

天気・地域・時間帯・施設運営・職員配置などの情報は、

利用者だけでは決定できない。

これらは

施設という Context に属する。

そのため、

RISEN CARE では Facility を

独立した基盤エンティティとして定義する。

---

# Role

Facility は、

利用者が生活する場所と

Observation が発生する環境を表す。

Facility を起点として、

以下を関連付ける。

- Residents
- Observations
- Weather
- Time Zone
- Region
- Facility Settings
- Management Intelligence
- Facility Intelligence

---

# Architecture

```text
Facility

├── Residents
├── Staff
├── Observations
├── Weather
├── Environment Context
├── Management Intelligence
└── Facility Intelligence
```

---

# Relationship

```text
Facility

↓

Resident

↓

Observation

↓

Observation Intelligence

↓

Resident Memory

↓

Dashboard
```

環境情報を利用する場合は、

次の流れとなる。

```text
Facility

↓

Location

↓

Weather

↓

Observation Context

↓

Search Engine

↓

Reasoning Engine
```

---

# Core Principle

Facility は

Observation そのものではない。

Facility は

Observation が発生した環境を定義する Context である。

---

# Data Model

テーブル名

```text
facilities
```

推奨カラム

```text
id

code

name

legal_name

facility_type

postal_code

prefecture

city

address_line

latitude

longitude

timezone

is_default

is_active

created_at

updated_at
```

---

# Column Definitions

## id

Facility を一意に識別する UUID。

```text
uuid
```

---

## code

システム内で使用する施設コード。

例

```text
ICHIGO_NO_SATO
```

---

## name

画面表示用の施設名。

例

```text
いちごの里
```

---

## legal_name

正式名称。

必要な場合のみ使用する。

---

## facility_type

施設種別。

例

- 特別養護老人ホーム
- グループホーム
- 有料老人ホーム
- 障害者支援施設
- 共同生活援助
- デイサービス

---

## postal_code

郵便番号。

---

## prefecture

都道府県。

---

## city

市区町村。

---

## address_line

町名・番地などの詳細住所。

---

## latitude

緯度。

天気・地図・地域情報の取得に使用する。

---

## longitude

経度。

天気・地図・地域情報の取得に使用する。

---

## timezone

施設のタイムゾーン。

日本国内では通常、

```text
Asia/Tokyo
```

を使用する。

---

## is_default

施設が特定できない場合に使用する

既定施設かどうかを示す。

```text
true

false
```

---

## is_active

運用中の施設かどうかを示す。

```text
true

false
```

---

# Resident Relationship

利用者テーブルは、

Facility と関連付ける。

推奨カラム

```text
users.facility_id
```

関係

```text
facilities.id

↓

users.facility_id
```

1つの Facility に

複数の Resident が所属する。

---

# Observation Relationship

Observation は、

基本的に利用者から Facility を解決する。

```text
Observation

↓

user_id

↓

users.facility_id

↓

facilities.id
```

必要に応じて、

Observation 自体にも

```text
events.facility_id
```

を保持できる。

これは、

一時利用・外泊・他施設・医療機関など、

利用者の所属施設と Observation の発生場所が異なる場合に使用する。

---

# Facility Resolution

Facility は

以下の優先順位で決定する。

```text
1. Observation.facility_id

↓

2. Resident.facility_id

↓

3. Default Facility
```

---

# Daily Record Handling

日常記録内に

施設名が含まれている場合でも、

その文字列をそのまま Facility として使用しない。

日常記録の文字列は

Facility Resolver により

正式な Facility へ変換する。

例

```text
いちごの里

↓

facilities.code = ICHIGO_NO_SATO
```

---

# Invalid Facility Values

以下のような値は

Facility として扱わない。

例

- 夜
- 日勤
- 居室
- 食堂
- 廊下
- 洗面所
- 外出
- 不明

これらは、

時間帯・場所・勤務帯などの別 Context として扱う。

---

# Facility Resolver

Facility Resolver は、

記録内の施設名候補を

Facility Master へ変換する。

入力例

```text
いちごの里
```

出力例

```json
{
  "facility_id": "uuid",
  "facility_code": "ICHIGO_NO_SATO",
  "facility_name": "いちごの里"
}
```

解決できない場合は、

Default Facility を使用する。

---

# Initial Facility

最初の登録例

```text
code

ICHIGO_NO_SATO

name

いちごの里

timezone

Asia/Tokyo

is_default

true

is_active

true
```

住所・緯度・経度は、

正式な施設所在地を確認後に登録する。

---

# Weather Integration

Weather は

Facility の緯度・経度を利用して取得する。

```text
Facility

↓

Latitude / Longitude

↓

Weather Service

↓

Daily Weather

↓

Dashboard
```

Dashboard 表示例

```text
🌤 6月30日(火)

晴れ　最高29℃／最低22℃
```

---

# Weather Fallback

天気取得時の優先順位

```text
1. Observationに明示されたFacility

↓

2. ResidentのFacility

↓

3. Default Facility

↓

4. システム既定地点
```

Facility が取得できない場合でも、

システム既定地点を使用して

天気表示を継続できる設計とする。

---

# Observation Context

Facility を基盤として、

以下の環境情報を Observation Context に追加できる。

- Weather
- Temperature
- Humidity
- Atmospheric Pressure
- Season
- Holiday
- Facility Event
- Shift
- Disaster Information
- Infection Information

---

# Intelligence Usage

Facility Context は

以下で利用する。

- Search Engine
- AI Chat
- Observation Intelligence
- Management Intelligence
- Facility Intelligence
- Trend Analysis

---

# Explainability

AI が Facility Context を利用した場合は、

Observation と環境情報を分けて示す。

例

```text
Observation

6月30日に立ち上がれない記録があります。

Environment Context

同日は高温の気象条件でした。
```

天気と状態変化の因果関係は

断定しない。

---

# Security

Facility 情報は、

利用者情報とは別に管理する。

公開範囲は最小限とする。

Dashboard 側へ渡す情報は、

表示に必要な項目だけとする。

例

- Facility Name
- City
- Time Zone
- Weather

詳細住所や管理情報は、

必要がない限りブラウザへ渡さない。

---

# Multi-facility Support

Facility Model により、

複数施設を同じ RISEN CARE で管理できる。

```text
Organization

├── Facility A
├── Facility B
├── Facility C
└── Facility D
```

将来的には、

```text
Organization

↓

Facility

↓

Resident

↓

Observation
```

の階層へ拡張する。

---

# Management Intelligence

Facility は

Management Intelligence の集計単位となる。

例

- 施設別転倒傾向
- 夜間支援負荷
- 食事摂取状況
- 水分摂取状況
- Observation件数
- AI更新状況

---

# Facility Intelligence

Facility Intelligence は、

Facility 内の Observation を継続的に統合する。

目的

- 施設全体の状態把握
- 品質改善
- 組織学習
- Knowledge Evolution
- 多施設比較

---

# Migration Strategy

既存データへの移行は

段階的に行う。

```text
Step 1

facilities テーブル作成

↓

Step 2

いちごの里を登録

↓

Step 3

users.facility_id を追加

↓

Step 4

対象利用者へ facility_id を設定

↓

Step 5

events.facility_id を必要に応じて更新

↓

Step 6

Weather Service と接続
```

---

# Minimum Implementation

最初の実装では、

以下だけでよい。

```text
facilities

id
code
name
city
latitude
longitude
timezone
is_default
is_active
```

および

```text
users.facility_id
```

---

# Future

将来的には

以下を追加する。

- Organization Model
- Facility Settings
- Facility Calendar
- Shift Model
- Region Model
- Disaster Context
- Infection Context
- Multi-facility Comparison
- Facility Benchmark

---

# Design Principles

## Facility as Context

Facility は

Observation の環境 Context である。

---

## Observation First

Facility Context は

Observation を補完する。

Observation を置き換えない。

---

## Explainable

環境情報を利用した推論は、

Observation と分けて説明する。

---

## Scalable

単一施設から

多施設・地域単位へ拡張できる。

---

## Minimal First

最初は

施設名・所在地・緯度経度だけで開始する。

必要に応じて拡張する。

---

# Related Documents

- `190-care-intelligence-platform/190-care-intelligence-platform.md`
- `191-platform-architecture.md`
- `192-observation-pipeline.md`
- `194-search-engine.md`
- `196-dashboard.md`
- `197-management-intelligence.md`
- `198-facility-intelligence.md`
- `199-roadmap.md`
- `202-weather-service.md`
- `203-observation-context.md`

