# Target CSV

## Purpose

対象CSVは、各福祉施設の業務システムから出力される日常記録データである。

RISENは特定の施設システムに依存しない。

CSVの列名・項目・データ構造は施設ごとに異なることを前提とする。

そのため、RISENではCSVを直接データベースへ登録せず、施設別Mapperを介して共通データモデルへ変換する。

---

# RISEN Data Flow

```
Facility System
        │
        ▼
   Daily Record CSV
        │
        ▼
 Facility Mapper
        │
        ▼
 Common Observation
        │
        ├── events
        ├── event_values
        ├── attachments
        └── Knowledge
```

---

# Facility Mapper

施設ごとにMapperを用意する。

例

- IchigoMapper
- TanpopoMapper
- SakuraMapper
- DefaultMapper

MapperはCSV項目を解析し、RISEN共通Observationへ変換する責任を持つ。

---

# Example : いちごの里CSV

確認済み項目

- ID
- 日時
- 氏名
- 処遇内容
- 記入者
- 種類
- 保護
- データ1
- データ2
- データ3
- データ4
- データ5
- データ6
- データ7
- データ8
- 気温
- 天気
- その他1
- 詳細
- 詳細2
- その他2
- その他3
- 在園状態
- 修正
- 状態
- 作成日時
- 行動
- 詳細KEY

※この項目構成はいちごの里専用であり、他施設では異なる可能性がある。

---

# Common Observation

Mapperは施設CSVを次の共通モデルへ変換する。

## 基本情報

- source_system
- source_record_id
- facility
- user
- staff
- event_datetime

## イベント情報

- event_type
- category
- summary
- memo

## 属性情報

- values
- context
- status

---

# Mapping Policy

Mapperは次の役割を担う。

- CSV列名の吸収
- 日付形式の統一
- 利用者の照合
- 職員の照合
- イベント種別の判定
- データ項目の正規化
- 共通Observationへの変換

---

# Design Principles

RISEN DatabaseはCSV構造に依存しない。

CSVは入力形式の一つであり、内部ではすべて共通Observationとして扱う。

これにより、

- 新しい施設の追加
- システム変更
- CSV仕様変更

が発生しても、Mapperのみを変更すればRISEN本体は変更せずに対応できる。

---

# Future Expansion

将来的にはCSVだけでなく、

- Google Spreadsheet
- REST API
- HL7 FHIR
- 音声入力
- モバイルアプリ
- IoTセンサー

なども同じObservationへ変換し、統一的に管理する。

CSVはRISENへの入力チャネルの一つとして位置付ける。

