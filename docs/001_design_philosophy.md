# 001 Design Philosophy

## Reality Driven Design

RISENはデータベースを作ることが目的ではない。

現場で起きる出来事（Reality）を理解し、
構造化されたKnowledgeへ変換することを目的とする。

Mission

> 理解から、価値をつくる。

このMissionを設計へ落とし込んだ結果、
RISENはReality Driven Architectureを採用する。

---

# Salesforceとの違い

Salesforceはレコード（Record）を中心に業務を管理する。

```
Customer
    ↓
Opportunity
    ↓
Contract
    ↓
Activity
```

CRMとして非常に優れた設計であり、
顧客・営業・契約などの業務プロセス管理に適している。

しかし、介護・福祉などの現場では、
管理したい対象はレコードではない。

管理したいものは、

**「現場で起きた出来事」**

である。

---

# Record Driven と Reality Driven

## Record Driven

```
Record
    ↓
Record
    ↓
Record
```

データを管理する。

---

## Reality Driven

```
Reality
    ↓
Understand
    ↓
Event
    ↓
Structure
    ↓
Knowledge
    ↓
Value
```

現実を理解し、
出来事として構造化し、
知識へ育てる。

---

# Eventとは

Eventは単なるレコードではない。

Eventは、

**現実を理解する最小単位**

である。

例えば

```
排泄支援

↓

尿

普通量

清拭

ウォシュレット
```

施設システムでは複数レコードとして保存される。

RISENでは

```
Event

排泄支援

├── 尿
│     └── 普通量
├── 清拭
└── ウォシュレット
```

という一つの出来事として理解する。

---

# Structure

RISENのコア技術はAIではない。

知識を構造化することである。

構造化されたKnowledgeがあることで

- AI
- 検索
- 分析
- 文書生成
- ナレッジ共有

が可能になる。

AIはKnowledgeを活用する存在であり、
Knowledgeを作る土台は構造化である。

---

# Knowledge First

RISENは記録を残すシステムではない。

記録をKnowledgeへ育てるシステムである。

```
Record

↓

Event

↓

Knowledge

↓

Value
```

---

# Design Principle

現場をシステムへ合わせるのではない。

システムを現場へ合わせる。

そのために、

Reality

↓

Understand

↓

Structure

↓

Knowledge

という設計を採用する。

---

# RISEN Definition

RISENは、

現場で起きる現実（Reality）を理解し、

出来事（Event）として構造化し、

Knowledgeへ変換することで、

新たな価値を創出するKnowledge OSである。

---

# Structure Discovery

従来のシステム開発では、最初にデータベース設計を行い、
その設計に合わせてシステムを構築してきた。

```
Requirements
    ↓
Database Design
    ↓
Application
```

この方法は、
人が構造を設計し、
コンピュータはその設計通りに動くことを前提としている。

---

## AI時代の開発

AI時代では、最初に構造を決める必要はない。

現場データを分析することで、

- イベントのパターン
- データの意味
- 繰り返し
- 階層構造
- 業務フロー

を発見できるようになった。

```
Reality
    ↓
Observation
    ↓
Structure Discovery
    ↓
Knowledge Model
    ↓
Database Design
```

RISENでは、
データベースを設計する前に、
現場を理解し、
データから構造を発見する。

その結果として、
Knowledge Modelを設計し、
最後にDatabase Designを行う。

---

## Example

今回の施設CSVでは、

```
トイレ確認

尿

普通量

清拭

ウォシュレット
```

という複数レコードが存在していた。

従来であれば、

「複数レコードが存在する」

という事実だけを見る。

RISENでは、

```
Reality

↓

排泄支援という一つの出来事

↓

尿
普通量
清拭
ウォシュレット

↓

Event

↓

Knowledge
```

という構造を発見した。

この発見によって、

events

↓

event_values

というKnowledge Modelが設計された。

---

## Design Principle

RISENは構造を最初に決めない。

現場を理解し、

データを観察し、

構造を発見し、

Knowledge Modelを設計する。

Databaseはその結果である。

---

## Core Message

設計する前に、

理解する。

理解する前に、

観察する。

RISENは、

構造を設計するシステムではなく、

**構造を発見するKnowledge OS**である。
