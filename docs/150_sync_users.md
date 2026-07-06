# 150 Sync Users

## Purpose

Google Spreadsheetの利用者台帳をSupabaseのusersテーブルへ同期する。

Googleは入力・運用画面として使い、RISEN Databaseに利用者情報を蓄積する。

## Flow

Google Spreadsheet  
↓  
GAS  
↓  
Supabase users  

## Target Sheet

利用者台帳

## Target Table

users

## Mapping

| Spreadsheet | Supabase |
|---|---|
| 利用者番号 | user_code |
| 利用者名 | name |
| フリガナ | kana |
| 生年月日 | birth_date |
| 性別 | gender |

## Principle

Googleは入力元であり、Knowledgeの保存先ではない。

RISEN Databaseが利用者情報の基盤となる。
