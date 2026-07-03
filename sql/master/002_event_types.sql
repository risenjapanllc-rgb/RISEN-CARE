-- ==========================================
-- RISEN Knowledge OS
-- Master Data
-- event_types
-- ==========================================

INSERT INTO event_types
(code, name, category_id, description)
VALUES

(
  'sleep_status',
  '睡眠状況',
  (SELECT id FROM event_categories WHERE code = 'sleep'),
  '睡眠・覚醒・入眠などの状態確認'
),

(
  'toilet_check',
  'トイレ確認',
  (SELECT id FROM event_categories WHERE code = 'excretion'),
  '排泄の有無・状態・介助内容の確認'
),

(
  'assisted_movement',
  '付添移動',
  (SELECT id FROM event_categories WHERE code = 'movement'),
  '職員付き添いによる移動支援'
),

(
  'behavior_record',
  '行動記録',
  (SELECT id FROM event_categories WHERE code = 'behavior'),
  '利用者の行動・様子・発言などの記録'
),

(
  'room_status',
  '居室',
  (SELECT id FROM event_categories WHERE code = 'environment'),
  '居室内での状態・様子'
),

(
  'general_care_record',
  '支援記録',
  (SELECT id FROM event_categories WHERE code = 'other'),
  '分類未確定の支援記録'
);
