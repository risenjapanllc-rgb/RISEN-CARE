# CSV Analysis

## Purpose

本書は、施設から提供されたCSVデータを分析し、
RISEN Knowledge OSへ取り込むための基礎資料である。

CSVをそのまま取り込むことを目的とせず、
現場データの構造を理解し、
Knowledge DBへ変換するための分析結果をまとめる。

---

# Data Source

- Source：施設管理システム
- Format：CSV
- Origin：MySQL Export

---

# CSV Structure

主な項目

| CSV項目 | 内容 |
|---------|------|
| ID | レコードID |
| 日時 | イベント日時 |
| 氏名 | 利用者 |
| 記入者 | 職員 |
| 処遇内容 | イベント名 |
| 種類 | イベント詳細 |
| データ1〜8 | イベントごとの付加情報 |
| 詳細 | 自由記述 |
| 状態 | 在園状態 |
| 気温 | 気象情報 |
| 天気 | 気象情報 |

---

# Data Characteristics

## 1. 1イベント = 複数レコード

施設システムでは、
1回の支援を複数行に分割して保存している。

例

トイレ確認

↓

・トイレ確認
・尿（普通量）
・清拭
・ウォシュレット

RISENでは、
これらを1つのEventとして統合する。

---

## 2. イベント中心構造

CSVは

日時
利用者
記入者

を中心として、

種類

データ1〜8

詳細

が付加される構造になっている。

---

## 3. データ1〜8

データ1〜8は固定項目ではない。

イベントによって意味が変化する。

例

尿
↓

データ1 = 普通量

睡眠
↓

データ1 = 熟睡

RISENでは固定カラムを持たず、
event_itemsで管理する。

---

## 4. 自由記述

詳細には重要なKnowledgeが含まれる。

AIによる

- 要約
- キーワード抽出
- Knowledge生成

対象となる。

---

# RISEN Mapping Policy

CSVは直接Knowledgeにならない。

CSV

↓

Mapping

↓

events

↓

event_values

↓

Knowledge

という変換を行う。

---

# Current Findings

確認できたイベント

- 睡眠
- トイレ確認
- 行動記録
- 付添移動

今後CSV全体を分析し、
Category・Type・Itemを整理する。

---

# Next Step

- MySQL Mapping作成
- 初期マスタ設計
- Database Design更新
- Supabase反映
