# 020 Google Apps Script

Version: v1.0

---

# Purpose

本書は、RISEN CAREにおけるGoogle Apps Script（GAS）の実装方針と主要構成を定義する。

GASは、以下を接続する実行基盤として利用する。

- Google Spreadsheet
- Supabase
- OpenAI
- Dashboard
- Observation Intelligence
- Resident Memory
- AI Chat

---

# Role

GASは、RISEN CAREにおけるアプリケーション実行層である。

主な役割は以下とする。

- Spreadsheetから記録を取得する
- Supabaseへデータを送信する
- Supabaseからデータを取得する
- OpenAI APIを呼び出す
- Observation Intelligenceを実行する
- Resident Memoryを更新する
- Dashboardへデータを返す
- AI Chatの質問を処理する

---

# System Position

```text
Google Spreadsheet

↓

Google Apps Script

├── Supabase
├── OpenAI
├── Dashboard
└── AI Chat
```

---

# GAS Projects

RISEN CAREでは、役割に応じてGASプロジェクトを分ける。

## 1. Data Sync Project

SpreadsheetとSupabaseの同期を担当する。

主な処理

- Users Sync
- Daily Records Sync
- Event Mapper
- Unmapped Observation Check

---

## 2. Intelligence Project

Observation IntelligenceとAI処理を担当する。

主な処理

- Knowledge Graph構築
- Observation Sequence生成
- Episode生成
- Pattern分析
- Trigger分析
- Observation Intelligence生成
- Resident Memory更新
- Resident AI Chat

---

## 3. Dashboard Project

利用者ダッシュボードの表示を担当する。

主な処理

- Dashboardデータ取得
- Resident Memory取得
- Recent Observations取得
- HTML表示
- Web App公開

---

# Script Properties

APIキーや接続情報は、コードへ直接記述しない。

Apps ScriptのScript Propertiesへ保存する。

主な設定値

```text
SUPABASE_URL
SUPABASE_ANON_KEY
OPENAI_API_KEY
SPREADSHEET_DAILY
SPREADSHEET_MASTER
```

必要に応じて追加する。

```text
SUPABASE_API_KEY
SUPABASE_SERVICE_ROLE_KEY
```

Secret Keyは、ブラウザ側へ渡さない。

---

# Supabase Connection

GASからSupabase REST APIを利用する。

基本URL

```text
{SUPABASE_URL}/rest/v1/
```

RPCの場合

```text
{SUPABASE_URL}/rest/v1/rpc/{function_name}
```

---

# Supabase Request Headers

基本ヘッダー

```javascript
{
  apikey: SUPABASE_ANON_KEY
}
```

必要に応じて以下を追加する。

```javascript
{
  Prefer: 'return=representation'
}
```

Upsertの場合

```javascript
{
  Prefer: 'resolution=merge-duplicates,return=representation'
}
```

---

# Supabase Configuration

各ファイルで接続情報取得処理を重複させない。

共通関数として管理する。

例

```javascript
function getSupabaseConfig() {
  const properties =
    PropertiesService.getScriptProperties();

  const url =
    properties.getProperty('SUPABASE_URL');

  const apiKey =
    properties.getProperty('SUPABASE_ANON_KEY') ||
    properties.getProperty('SUPABASE_API_KEY');

  if (!url) {
    throw new Error(
      'SUPABASE_URL が設定されていません。'
    );
  }

  if (!apiKey) {
    throw new Error(
      'Supabase API Key が設定されていません。'
    );
  }

  return {
    url: url.trim().replace(/\/+$/, ''),
    apiKey: apiKey.trim()
  };
}
```

---

# OpenAI Connection

OpenAI Responses APIを利用する。

Endpoint

```text
https://api.openai.com/v1/responses
```

基本リクエスト

```javascript
const payload = {
  model: 'gpt-5.5',
  input: prompt
};
```

ヘッダー

```javascript
{
  Authorization: 'Bearer ' + apiKey
}
```

---

# OpenAI Response Handling

OpenAI Responses APIは、本文全体ではなく、実際の出力テキストを抽出する必要がある。

主な取得対象

```text
output
  └── message
        └── content
              └── output_text
```

例

```javascript
function extractOpenAIOutputText(responseJson) {
  if (
    typeof responseJson.output_text === 'string'
  ) {
    return responseJson.output_text;
  }

  const texts = [];

  (responseJson.output || []).forEach(function(item) {
    if (
      item.type !== 'message' ||
      !Array.isArray(item.content)
    ) {
      return;
    }

    item.content.forEach(function(content) {
      if (
        content.type === 'output_text' &&
        typeof content.text === 'string'
      ) {
        texts.push(content.text);
      }
    });
  });

  return texts.join('\n').trim();
}
```

---

# Observation Intelligence Flow

GAS上では、以下の順番で処理する。

```text
buildObservationSequence()

↓

buildUserState()

↓

buildKnowledgeGraphSummary()

↓

buildEpisodes()

↓

summarizeEpisode()

↓

Pattern Analysis

↓

Trigger Analysis

↓

createObservationIntelligenceReportPromptV2()

↓

callOpenAIReasoningV2()

↓

saveObservationIntelligenceReportV2()

↓

resident_memory Upsert
```

---

# Main Observation Intelligence Function

1利用者分の実行関数

```text
runObservationIntelligenceV2(userId)
```

役割

- Observation取得
- Knowledge取得
- Episode生成
- AI Prompt生成
- OpenAI呼び出し
- Intelligence Report保存
- Resident Memory更新

---

# Resident Memory

Observation Intelligenceの結果を、Supabaseの以下へ保存する。

```text
public.resident_memory
```

主な項目

```text
user_id
summary
current_status
watch_points
support_preferences
important_patterns
recent_changes
confidence
source_report_id
generated_at
updated_at
```

同じ利用者についてはUpsertする。

Conflict Key

```text
user_id
```

---

# Resident Memory Upsert

基本構造

```javascript
const url =
  `${config.url}/rest/v1/resident_memory` +
  `?on_conflict=user_id`;
```

ヘッダー

```javascript
{
  apikey: config.apiKey,
  Prefer:
    'resolution=merge-duplicates,return=representation'
}
```

---

# Dashboard Data Flow

```text
Dashboard.html

↓

google.script.run

↓

loadDashboardData(userId)

↓

Supabase RPC

↓

Resident Information
Recent Observations
```

Resident Memoryは別途取得する。

```text
getResidentMemory(userId)
```

Dashboardは以下を表示する。

- Current Status
- Watch Points
- Important Patterns
- Resident Summary
- Recent Observations

---

# AI Chat Flow

```text
Question

↓

buildResidentContext()

↓

createResidentChatPrompt()

↓

callResidentChat()

↓

OpenAI

↓

Answer
```

現在のResident Contextには以下を含む。

- Resident Memory
- User State
- Observation Sequence
- Knowledge Timeline
- Episodes

将来的にはSearch Engine経由へ変更する。

---

# Search Engine Transition

現在の実装では、72時間分のObservationやKnowledgeをまとめてAIへ渡している。

今後は以下へ移行する。

```text
Question

↓

buildResidentSearchContext()

↓

Observation Search

↓

Knowledge Search

↓

Episode Search

↓

Relevant Context

↓

OpenAI
```

目的

- Input Token削減
- 応答速度向上
- API費用削減
- 長期データ対応
- 検索精度向上

---

# File Naming

GASファイル名は、役割が分かる名前にする。

例

```text
buildObservationSequence.gs
buildUserState.gs
buildEpisodes.gs
createObservationIntelligenceReportPromptV2.gs
callOpenAIReasoningV2.gs
saveObservationIntelligenceReportV2.gs
runObservationIntelligenceV2.gs
buildResidentContext.gs
createResidentChatPrompt.gs
callResidentChat.gs
```

---

# Function Naming

基本ルール

```text
build...
create...
get...
save...
call...
run...
test...
```

例

```text
buildResidentContext()
createResidentChatPrompt()
getResidentMemory()
saveObservationIntelligenceReportV2()
callResidentChat()
runObservationIntelligenceV2()
testCallResidentChat()
```

---

# Test Functions

各主要処理には、必ずテスト関数を用意する。

例

```text
testBuildResidentContext()
testCreateResidentChatPrompt()
testCallResidentChat()
testRunObservationIntelligenceV2()
testGetResidentMemory()
```

テスト関数は、本番処理と分離する。

---

# Logging

確認すべき内容

- HTTP Status
- Error Response
- User ID
- Target Period
- Insert Result
- Upsert Result
- OpenAI Response Status

大量のContext全体をLoggerへ出力しない。

長大なJSONは、以下のように要約して出力する。

```javascript
Logger.log(
  JSON.stringify({
    user_id: context.user_id,
    observation_count:
      context.observations.total_events,
    has_resident_memory:
      !!context.resident_memory,
    episode_count:
      context.episodes.episodes.length
  }, null, 2)
);
```

---

# Error Handling

HTTPエラーは必ず検知する。

```javascript
if (
  statusCode < 200 ||
  statusCode >= 300
) {
  throw new Error(
    `API Error ${statusCode}: ${responseText}`
  );
}
```

入力値の検証も行う。

```javascript
if (!userId) {
  throw new Error('userId が必要です。');
}
```

---

# Security

以下をコードへ直接書かない。

- OpenAI API Key
- Supabase Secret Key
- Service Role Key
- Personal Information

API KeyはScript Propertiesで管理する。

Dashboardのブラウザ側JavaScriptへ、Secret Keyを渡さない。

---

# Deployment

Dashboard Web Appを更新した場合は、保存だけでは反映されない。

実施手順

```text
Deploy

↓

Manage deployments

↓

Edit

↓

New version

↓

Deploy
```

新しいWeb App URLまたは既存URLで動作確認する。

---

# Performance

GASには実行時間制限がある。

長時間処理を避ける。

対策

- 一度に全利用者を処理しない
- 1利用者ずつ実行する
- バッチ分割する
- Triggerを利用する
- Contextを小さくする
- Supabase側で絞り込む
- 同じ処理を繰り返さない

---

# Batch Processing

全利用者処理は、1名版の完成後に実装する。

基本構造

```text
Users取得

↓

対象者を一定数に分割

↓

runObservationIntelligenceV2(userId)

↓

成功・失敗を記録

↓

次のバッチ
```

一度に全利用者を実行しない。

---

# Operational Policy

GASは、RISEN CAREの実行基盤である。

ただし、複雑な検索や大量集計はGASだけで行わない。

役割分担

```text
GAS
= Orchestration

Supabase
= Data and Search

OpenAI
= Reasoning

Dashboard
= Experience
```

---

# Success Criteria

以下を満たした場合、本実装は正常とする。

- Supabase接続成功
- OpenAI接続成功
- Observation取得成功
- Observation Intelligence生成成功
- Resident Memory更新成功
- Dashboard表示成功
- AI Chat回答成功
- API Keyがコードに露出していない
- エラーがログで確認できる

---

# Related Documents

- `010-implementation-guide.md`
- `030-supabase.md`
- `040-openai.md`
- `050-observation-intelligence.md`
- `060-resident-memory.md`
- `070-search-engine.md`
- `080-dashboard.md`
- `090-deployment.md`
