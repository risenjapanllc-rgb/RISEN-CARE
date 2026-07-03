# MySQL Mapping

Version: 0.1  
Last Updated: 2026-07-03

---

# Purpose

本書は、施設システム（MySQL）から取得したデータを
RISEN Knowledge OSへ変換するためのマッピング仕様を定義する。

RISENは入力元に依存しない。

MySQL API、CSV、Web入力、音声入力など、
すべての入力データは同一のKnowledge Modelへ変換される。

---

# Data Flow

```
MySQL
      │
      ▼
Data Connector
      │
      ▼
Mapper
      │
      ▼
Event Grouper
      │
      ▼
RISEN Knowledge DB
      │
      ▼
Knowledge
```

---

# Mapping Policy

RISENではデータをそのまま保存しない。

Reality

↓

Observation

↓

Event

↓

Event Values

↓

Knowledge

という変換を行う。

---

# MySQL → RISEN Mapping

| MySQL | RISEN | Description |
|--------|--------|-------------|
| ID | source_record_id | 元レコードID |
| 日時 | event_datetime | イベント日時 |
| 氏名 | case_record | 利用者 |
| 記入者 | user | 記録者 |
| 処遇内容 | event_type | イベント種別 |
| 種類 | event_item | イベント項目 |
| データ1〜8 | value_text | 項目値 |
| 詳細 | memo | 自由記述 |
| 在園状態 | status | 利用者状態 |
| 状態 | source_status | 元システム状態 |
| 気温 | temperature | 気温 |
| 天気 | weather | 天候 |

---

# Event Grouping

同一Eventの条件

- 日時
- 利用者
- 記入者
- 処遇内容

一致するレコードを
1つのEventとして統合する。

---

# Event Structure

例

```
排泄支援

├── 尿
│      └── 普通量
├── 清拭
└── ウォシュレット
```

↓

```
events

排泄支援

↓

event_values

尿 = 普通量

清拭

ウォシュレット
```

---

# Input Sources

RISENは入力元を限定しない。

対応予定

- MySQL API
- CSV Import
- Google Drive
- Google Sheets
- Web Input
- Mobile Input
- Voice Input

---

# Design Principle

入力方法が異なっても、

Knowledge Modelは変わらない。

すべての入力は
共通のEvent構造へ変換される。

---

# Next Step

- Event Categories
- Event Types
- Event Items
- Database Design
- Supabase Implementation
