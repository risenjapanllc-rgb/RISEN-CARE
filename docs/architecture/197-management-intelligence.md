# 197 Management Intelligence

Version: v1.0

---

# Purpose

Management Intelligence は

施設全体の Observation を統合し、

管理者の意思決定を支援する。

利用者単位では見えない

施設全体の傾向や変化を可視化する。

---

# Role

Management Intelligence は

Observation Intelligence の結果を

施設全体で集約・分析する。

管理者が

迅速かつ根拠のある判断を行えることを目的とする。

---

# Architecture

```
All Residents

↓

Observation Intelligence

↓

Resident Memory

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

# Main Functions

Management Intelligence は

以下を提供する。

- Facility Overview
- Risk Monitoring
- Trend Analysis
- Resource Planning
- Committee Support
- Report Generation

---

# Facility Overview

施設全体の状態を表示する。

例

- 利用者数
- 注意利用者数
- Alert利用者数
- Observation件数
- AI更新状況

---

# Risk Monitoring

施設内で

重点的に確認すべき利用者を表示する。

例

- 転倒リスク
- 発熱
- 夜間覚醒
- 食事量低下
- 水分不足
- 行動変化

---

# Trend Analysis

施設全体の傾向を分析する。

例

- 転倒件数推移
- 発熱件数推移
- 夜間コール推移
- 排泄パターン
- 水分摂取傾向

---

# Resource Planning

支援状況を把握する。

例

- 夜勤負荷
- ケア集中時間帯
- 業務量
- 支援対象人数

---

# Committee Support

委員会資料作成を支援する。

例

- 事故防止委員会
- 身体拘束適正化委員会
- 感染対策委員会
- 褥瘡対策委員会
- 安全対策委員会

---

# Report Generation

Observation を基に

管理資料を生成する。

例

- 月次レポート
- 事故分析
- KPI
- 品質指標
- 加算資料

---

# AI Support

管理者は

自然言語で質問できる。

例

- 最近転倒が増えている？
- 夜間負担が大きい利用者は？
- 発熱が多い居室は？
- 食事量が低下している利用者は？
- 今週の重点確認事項は？

---

# Design Principles

## Observation First

分析は

Observation を根拠とする。

---

## Explainable

分析結果は

根拠となる Observation を示す。

---

## Facility-wide View

利用者単位ではなく

施設全体を対象とする。

---

## Decision Support

Management Intelligence は

管理者の意思決定を支援する。

最終判断は

管理者が行う。

---

# Future

将来的には

以下へ拡張する。

- 多施設比較
- 品質ベンチマーク
- 人員配置最適化
- AIアラート
- 経営分析
- 行政提出資料

---

# Related Documents

- 190 Care Intelligence Platform
- 193 Resident Memory
- 194 Search Engine
- 195 AI Chat
- 196 Dashboard
- 198 Facility Intelligence
- 199 Roadmap
