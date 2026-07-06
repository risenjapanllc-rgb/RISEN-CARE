# 130 CSV Import Engine

Version: 0.1

---

# Purpose

CSV Import Engineは、施設システムから出力されたCSVを
RISEN Knowledge Databaseへ取り込むための仕組みである。

CSVをそのまま保存するのではなく、
Observationとして理解し、
events / event_values へ変換する。

---

# Import Flow

CSV

↓

Parser

↓

Observation Mapping

↓

Event Grouping

↓

events

↓

event_values

↓

Knowledge

---

# Target CSV

対象CSVは、施設システムから出力された日常記録データである。

主な項目：

- ID
- 日時
- 氏名
- 処遇内容
- 記入者
- 種類
- データ1〜8
- 詳細
- 気温
- 天気
- 在園状態
- 状態
- 作成日時
- 行動

---

# Event Grouping Rule

次の項目が一致するレコードは、
同一Eventとして扱う。

- 日時
- 氏名
- 記入者
- 処遇内容
- 行動

---

# Mapping Policy

## events

| CSV | events |
|---|---|
| 日時 | event_datetime |
| 氏名 | case_record_id |
| 記入者 | staff_id |
| 処遇内容 | event_type |
| 行動 | action |
| 詳細 | memo |
| 気温 | temperature |
| 天気 | weather |
| ID | source_record_id |

---

## event_values

| CSV | event_values |
|---|---|
| 種類 | item |
| データ1 | value_text |
| データ2 | context_location |
| データ3〜8 | additional_values |

---

# Design Principle

CSVはRealityを記録した媒体である。

RISENはCSVを保存するのではなく、
その背後にあるObservationを構造化する。

---

# Next Step

1. Supabase側のevents構造確認
2. event_values構造確認
3. GASからCSVを読み取る
4. SupabaseへINSERT
5. AIチャットで確認
