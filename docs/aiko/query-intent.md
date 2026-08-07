# AIKO Query Intent Design

## 1. 目的

AIKOは、利用者からの自然言語による質問を解析し、その質問が何を求めているのか（Intent）を判定する。

質問の表現は無数に存在するが、AIKO内部では一定数の分析パターンへ正規化し、それぞれに適切な検索・分析・回答処理を実行する。

---

# 2. 基本方針

AIKOは質問文そのものを処理するのではなく、質問の「意図（Intent）」を解析する。

例

質問

「最近夜ちゃんと寝れてる？」

「この1ヶ月の睡眠時間は？」

「平均何時間寝ていますか？」

これらは表現は異なるが、内部では同じIntentとして扱う。

```
Intent

Aggregation

Target

Sleep

Metric

Average Duration

Period

1 Month
```

---

# 3. Query解析フロー

```
利用者の質問

↓

自然言語解析

↓

Intent判定

↓

対象データ判定

↓

分析タイプ判定

↓

検索条件生成

↓

Analysis Engine

↓

回答生成
```

---

# 4. Query構造

AIKOは質問を以下の要素へ変換する。

| 項目 | 内容 |
|------|------|
| Intent | 質問の目的 |
| Target | 対象データ |
| Metric | 知りたい指標 |
| Period | 対象期間 |
| Filter | 条件 |
| Output | 求める回答形式 |

例

```
Intent

Aggregation

Target

Sleep

Metric

Average Duration

Period

30 Days
```

---

# 5. Intent一覧

## Search

記録検索

例

・昨日の記録

・最新の支援記録

・転倒記録

---

## Summary

要約

例

・最近の様子

・今週の状況

・体調をまとめて

---

## Aggregation

集計

例

・平均睡眠時間

・途中覚醒回数

・食事量平均

・排便回数

---

## Comparison

比較

例

・先月との違い

・興奮あり・なしの日の違い

・昼夜の比較

---

## Trend Analysis

傾向分析

例

・睡眠時間は減っている？

・最近体重が増えている？

・血圧は安定している？

---

## Pattern Analysis

パターン分析

例

・興奮前の共通点

・転倒前の特徴

・夜間覚醒が多い日の傾向

---

## Recommendation Support

事前対応支援

例

・興奮しないために注意することは？

・転倒予防につながる特徴は？

・事前に確認するとよいことは？

AIKOは提案を行うが、最終判断は職員が行う。

---

# 6. Target一覧

分析対象の例

・利用者

・睡眠

・食事

・排泄

・バイタル

・支援記録

・ケース記録

・興奮

・転倒

・服薬

・職員

・サービス利用

---

# 7. Metric一覧

例

・平均

・回数

・合計

・最小

・最大

・割合

・変化量

・頻度

・継続時間

・増減

・順位

---

# 8. Period解析

期間指定がある場合は対象期間を決定する。

例

・今日

・昨日

・今週

・先週

・今月

・先月

・過去30日

・過去3ヶ月

期間指定がない場合は、質問内容に応じて適切な対象期間を設定する。

---

# 9. Filter解析

質問条件を抽出する。

例

・夜間のみ

・女性のみ

・興奮した日

・転倒した日

・デイサービス利用日

・食事拒否があった日

---

# 10. Output形式

質問によって出力形式を切り替える。

例

一覧

```
検索結果一覧
```

要約

```
文章
```

集計

```
平均
件数
最大
最小
```

比較

```
比較表
```

傾向

```
時系列
```

パターン

```
共通点一覧
```

提案

```
事前対応候補
```

---

# 11. Query例

## 平均睡眠時間は？

```
Intent

Aggregation

Target

Sleep

Metric

Average Duration

Period

30 Days
```

---

## 最近の様子を教えて

```
Intent

Summary

Target

Observation

Period

30 Days
```

---

## 興奮しなかった日の共通点

```
Intent

Comparison

Target

Agitation

Comparison

Positive / Negative

Period

90 Days
```

---

## 興奮前のパターン

```
Intent

Pattern Analysis

Target

Agitation

Window

24 Hours Before
```

---

# 12. Query Intentの役割

Query IntentはAIKO全体の入口となる。

質問文の違いを吸収し、検索・分析・回答まで一貫した処理へ変換する役割を担う。

自然言語は無数に存在するが、AIKO内部では限られた分析パターンへ正規化することで、再利用性・拡張性・保守性を高める。

---

# 13. 今後の拡張

将来的には以下のIntentを追加する。

・異常検知（Anomaly Detection）

・予測分析（Prediction）

・リスク評価（Risk Assessment）

・時系列イベント分析（Temporal Event Analysis）

・複数利用者比較（Population Analysis）

・施設全体分析（Facility Analytics）

これらも既存のIntent構造を拡張する形で実装する。
