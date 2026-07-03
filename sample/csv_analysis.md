# CSV Analysis

Version: 0.2  
Last Updated: 2026-07-03

---

# Purpose

本書は、施設から提供されたCSVデータを分析し、
RISEN Knowledge OSへ取り込むための基礎資料である。

CSVをそのまま取り込むことを目的とせず、
現場業務を理解し、
データから構造を発見し、
Knowledge Modelを設計するための分析結果をまとめる。

---

# Data Source

| Item | Value |
|------|------|
| Source | 施設管理システム |
| Origin | MySQL Export |
| Format | CSV |

---

# CSV Structure

| CSV Column | Description |
|------------|-------------|
| ID | レコードID |
| 日時 | イベント日時 |
| 氏名 | 利用者 |
| 記入者 | 職員 |
| 処遇内容 | イベント名 |
| 種類 | イベント詳細 |
| データ1〜8 | イベントごとの付加情報 |
| 詳細 | 自由記述 |
| 在園状態 | 利用者状態 |
| 状態 | システム状態 |
| 気温 | 気象情報 |
| 天気 | 気象情報 |

---

# Data Characteristics

## 1. One Event = Multiple Records

施設システムでは、
1回の支援を複数レコードへ分割して保存している。

例

```
トイレ確認

├─ トイレ確認
├─ 尿（普通量）
├─ 清拭
└─ ウォシュレット
```

RISENでは、
これらを1つのEventとして統合して管理する。

---

## 2. Event-Oriented Data

CSVは

- 日時
- 利用者
- 記入者

を中心に、

- 種類
- データ1〜8
- 詳細

が付加されるイベント中心の構造になっている。

---

## 3. Variable Attributes

データ1〜8は固定項目ではない。

イベントごとに意味が変化する。

例

```
尿
└── データ1 = 普通量

睡眠
└── データ1 = 熟睡
```

RISENでは固定カラムではなく、
Event Itemとして管理する。

---

## 4. Free Text

詳細には重要なKnowledgeが含まれる。

今後、

- AI要約
- キーワード抽出
- Knowledge生成

の対象となる。

---

# Event Grouping Rule

次の項目が一致する場合、
同一Eventとして扱う。

- 日時
- 利用者
- 記入者
- 処遇内容（行動）

その配下に

- 種類
- データ1〜8
- 詳細

を保持する。

---

# Confirmed Categories

現在確認できたカテゴリ

- 睡眠
- 排泄
- 行動
- 移動

今後CSV全体を分析して追加する。

---

# Confirmed Event Types

現在確認できたイベント

- 睡眠状況
- トイレ確認
- 行動記録
- 付添移動

今後CSV全体から抽出する。

---

# Confirmed Event Items

現在確認できた項目

- 熟睡
- 尿
- 普通量
- 清拭
- ウォシュレット
- 居室
- トイレ
- 尿便なし

今後CSV全体から抽出する。

---

# Structure Discovery

今回のCSV分析で判明したこと

- 現場はEvent単位で業務を行っている。
- CSVは1つのEventを複数レコードへ分割して保存している。
- データ1〜8は固定項目ではなく、イベントごとに意味が変化する。
- RISENではEventをKnowledgeの最小単位として管理する。

---

# RISEN Transformation Model

RISENではCSVを直接Knowledgeへ変換しない。

```
Reality
    ↓
Observation
    ↓
Event
    ↓
Event Values
    ↓
Knowledge
```

CSVはRealityを記録した媒体であり、
RISENはその背後にある出来事（Event）を理解し、
Knowledgeへ構造化する。

---

# Findings

今回の分析により、

施設システムは

**「1イベント＝複数レコード」**

という保存構造を持つことが確認できた。

RISENでは、
複数レコードを1つのEventとして統合し、
Knowledgeとして管理する。

この分析結果は、

- Master Design
- Database Design
- MySQL Mapping
- AI Event Extraction

の設計根拠となる。

---

# Next Step

- MySQL Mapping
- Event Category Design
- Event Type Design
- Event Item Design
- Database Design
- Supabase Implementation
