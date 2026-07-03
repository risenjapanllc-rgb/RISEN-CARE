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
