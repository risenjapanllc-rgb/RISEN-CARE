-- ==========================================
-- RISEN Knowledge OS
-- Master Data
-- event_types
-- ==========================================

INSERT INTO event_types
(code, name, category_id, description)
VALUES

(
  'sleep',
  '睡眠',
  (SELECT id FROM event_categories WHERE code = 'sleep'),
  '就寝・起床・入眠・覚醒・睡眠状態に関するObservation'
),

(
  'excretion',
  '排泄',
  (SELECT id FROM event_categories WHERE code = 'excretion'),
  '排尿・排便・トイレ誘導・排泄介助に関するObservation'
),

(
  'movement',
  '移動',
  (SELECT id FROM event_categories WHERE code = 'movement'),
  '歩行・移乗・離床・付き添い移動に関するObservation'
),

(
  'location_confirmation',
  '所在確認',
  (SELECT id FROM event_categories WHERE code = 'environment'),
  '居室・廊下・食堂など利用者の所在確認に関するObservation'
),

(
  'behavior',
  '行動',
  (SELECT id FROM event_categories WHERE code = 'behavior'),
  '利用者の行動・様子・発言・落ち着きなどに関するObservation'
),

(
  'meal',
  '食事',
  (SELECT id FROM event_categories WHERE code = 'meal'),
  '食事摂取・食事介助・食事量に関するObservation'
),

(
  'hydration',
  '水分',
  (SELECT id FROM event_categories WHERE code = 'meal'),
  '水分摂取・飲水量・脱水予防に関するObservation'
),

(
  'medication',
  '服薬',
  (SELECT id FROM event_categories WHERE code = 'medication'),
  '服薬・投薬・薬の確認に関するObservation'
),

(
  'hygiene',
  '清潔',
  (SELECT id FROM event_categories WHERE code = 'cleaning'),
  '歯磨き・整容・清拭など清潔保持に関するObservation'
),

(
  'bathing',
  '入浴',
  (SELECT id FROM event_categories WHERE code = 'cleaning'),
  '入浴・シャワー浴・入浴介助に関するObservation'
),

(
  'vital',
  'バイタル',
  (SELECT id FROM event_categories WHERE code = 'vital'),
  '体温・血圧・脈拍・SpO2などの測定に関するObservation'
),

(
  'health',
  '健康',
  (SELECT id FROM event_categories WHERE code = 'health'),
  '体調不良・受診・疼痛・疾病に関するObservation'
),

(
  'incident',
  '事故',
  (SELECT id FROM event_categories WHERE code = 'incident'),
  '転倒・転落・ヒヤリハット・事故に関するObservation'
),

(
  'communication',
  'コミュニケーション',
  (SELECT id FROM event_categories WHERE code = 'communication'),
  '会話・相談・家族連携・職員間共有に関するObservation'
),

(
  'activity',
  '活動',
  (SELECT id FROM event_categories WHERE code = 'activity'),
  'レクリエーション・作業・日中活動に関するObservation'
),

(
  'support',
  '支援',
  (SELECT id FROM event_categories WHERE code = 'other'),
  '個別支援・生活支援・分類前の支援内容に関するObservation'
),

(
  'physical_restraint',
  '身体拘束・行動制限レビュー',
  (SELECT id FROM event_categories WHERE code = 'incident'),
  '身体拘束・行動制限に関するReview対象Observation'
),

(
  'other',
  'その他',
  (SELECT id FROM event_categories WHERE code = 'other'),
  '分類未定またはMapper追加前のObservation'
);
