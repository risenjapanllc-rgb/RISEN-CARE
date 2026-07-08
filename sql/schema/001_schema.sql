【ファイル名】

001-schema.sql

【保存場所】

sql/schema/

【目的】

Supabaseで実行する全テーブルのCREATE TABLE文を作成してください。

【作成するテーブル】

Observation
- users
- events
- event_categories
- event_types
- event_mapper

Review
- review_types
- event_type_review_types

Knowledge
- knowledge_categories
- knowledge_nodes
- knowledge_relations
- event_type_knowledge

【含める内容】

・CREATE TABLE
・PRIMARY KEY
・FOREIGN KEY
・UNIQUE
・NOT NULL
・created_at
・updated_at

【含めない内容】

・INSERT文
・RLS
・Policies
・Triggers
・Functions
・Views
・Seedデータ

【完成条件】

Supabase SQL Editorへそのまま貼り付けて実行できる完成版SQL
