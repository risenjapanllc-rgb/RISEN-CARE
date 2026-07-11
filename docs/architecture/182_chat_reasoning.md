# 182 Chat Reasoning

Version: v1.0

---

# Purpose

RISEN CARE Chat は

介護記録検索システムではない。

利用者理解を支援する

AIパートナーである。

目的は

必要な情報を

最短で取得すること。

---

# Philosophy

職員は

検索条件

テーブル

画面遷移

を覚える必要はない。

自然な言葉で質問するだけでよい。

---

# Example Questions

## 利用者について

```
最近食欲はどう？

夜間覚醒は増えている？

最近転倒はあった？

排泄状況は？

体重は変化している？

服薬変更後どう？
```

---

## 過去検索

```
去年の夏は？

3年前は？

以前も便秘だった？

前回入院前は？

施設入所直後は？
```

---

## 傾向

```
最近変わったことは？

以前との違いは？

良くなっている？

悪くなっている？

夜間が増えている？
```

---

## ケア

```
何を注意したらいい？

今日の観察ポイントは？

申し送り事項は？

家族へ伝えることは？
```

---

# Search Flow

Chatは回答前に

Observation

↓

Knowledge

↓

Episode

↓

Pattern

↓

Review

↓

Reasoning

を実行する。

文章検索だけを行わない。

---

# AI Answer Structure

AIは毎回

以下の順番で回答する。

---

## 1 Answer

質問への回答。

---

## 2 Evidence

根拠。

Observation

Knowledge

Episode

Pattern

Review

---

## 3 Timeline

必要なら時系列。

例

```
2023年

↓

2024年

↓

現在
```

---

## 4 Confidence

high

medium

low

---

# Search Scope

AIは

Observation

Knowledge

Episode

Pattern

Review

Daily Record

Medical

Care Plan

Family

を横断検索する。

---

# Time Search

利用者は

時間軸で理解する。

例

```
今日

昨日

先週

先月

去年

3年前

入所時

退院後

服薬変更後
```

---

# Semantic Search

AIは

言葉ではなく

意味で検索する。

例

質問

```
転倒
```

検索対象

```
ふらつき

立ち上がれない

床に座り込む

転びそう

歩行不安定
```

---

# Reasoning

AIは

Observation

Knowledge

Episode

Pattern

を統合して

利用者理解を行う。

---

# Safety

Observationに存在しない事実を作らない。

原因を断定しない。

診断しない。

推測は推測として伝える。

---

# Goal

RISEN CARE Chat の目的は

「探す」

から

「聞く」

への転換である。

介護記録を読む時間を減らし

利用者と向き合う時間を増やす。
