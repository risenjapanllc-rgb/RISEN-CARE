# 197 Management Intelligence

Version: v2.0

---

# Purpose

Management Intelligence は

施設全体の利用者理解を統合し、

管理者の意思決定を支援する。

利用者単位では見えない

施設全体の状態・変化・傾向を可視化し、

管理業務を支援することを目的とする。

---

# Role

Management Intelligence は

Resident Intelligence を集約し、

施設全体の Intelligence を生成する。

分析そのものではなく、

管理者が

「今、施設全体をどう理解するか」

を支援する。

---

# Architecture

```text
Observation

↓

Observation Intelligence

↓

Resident Memory

↓

Resident Intelligence

↓

Management Intelligence

↓

Management Dashboard
```

---

# Target Users

- 施設長
- 管理者
- 看護責任者
- ケアマネジャー
- 主任
- リーダー

---

# Management Components

Management Intelligence は

以下を提供する。

- Facility Overview
- Current Situation
- Risk Monitoring
- Trend Analysis
- Resource Planning
- Committee Intelligence
- Report Generation
- AI Chat

---

# Facility Overview

施設全体の現在の状態を表示する。

例

- 利用者数
- 要注意利用者数
- 状態変化利用者数
- Observation件数
- AI更新状況

---

# Current Situation

施設全体の利用者理解を要約する。

例

- 転倒関連Observationが増加
- 夜間覚醒利用者が増加
- 発熱利用者は減少
- 食事状況は安定

管理者は

数値ではなく

現在の施設状況を理解できる。

---

# Risk Monitoring

重点的に確認すべき利用者を表示する。

例

- 転倒リスク
- 発熱
- 夜間覚醒
- 食欲低下
- 水分不足
- 行動変化

Observation を根拠とする。

---

# Trend Analysis

施設全体の傾向を表示する。

例

- 転倒件数推移
- 発熱件数推移
- 夜間コール推移
- 排泄傾向
- 水分摂取傾向

Trend は

Observation の積み重ねから生成される。

---

# Resource Planning

施設運営を支援する。

例

- 夜勤負荷
- ケア集中時間帯
- 業務負荷
- 支援対象人数

---

# Committee Intelligence

委員会活動を支援する。

対象

- 事故防止委員会
- 身体拘束適正化委員会
- 感染対策委員会
- 褥瘡対策委員会
- 安全対策委員会

Observation を根拠として

委員会資料を生成する。

---

# Report Generation

Observation Intelligence を利用し、

管理資料を生成する。

例

- 月次レポート
- KPI
- 品質指標
- 事故分析
- 加算資料

---

# AI Chat

管理者は

自然言語で施設全体について質問できる。

例

- 最近転倒は増えている？
- 夜勤負荷が高い時間帯は？
- 発熱利用者は何人？
- 今週の重点確認事項は？
- 夜間覚醒利用者を教えて。

---

# Explainability

すべての分析は

Observation を根拠とする。

管理者は

分析結果から

Observation まで追跡できる。

---

# Design Principles

## Observation First

すべての分析は

Observation を基盤とする。

---

## Understanding First

数値だけではなく、

施設全体の理解を支援する。

---

## Explainable

分析結果は

Observation を根拠とする。

---

## Decision Support

Management Intelligence は

管理者の意思決定を支援する。

最終判断は

管理者が行う。

---

## Scalable

利用者数が増えても

同じ Intelligence Engine を利用する。

---

# Future

将来的には

以下へ拡張する。

- Multi-facility Intelligence
- Benchmark Analysis
- Quality Intelligence
- Staffing Intelligence
- Executive Intelligence
- AI Alert
- Predictive Management

---

# Related Documents

- 190 Care Intelligence Platform
- 193 Resident Memory
- 194 Search Engine
- 195 AI Chat
- 196 Dashboard
- 198 Facility Intelligence
- 199 Roadmap
