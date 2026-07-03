-- ==========================================
-- RISEN Knowledge OS
-- Master Data
-- event_categories
-- ==========================================

INSERT INTO event_categories
(code, name, description)
VALUES

('sleep',      '睡眠',     '睡眠・休息に関するイベント'),

('excretion',  '排泄',     '排泄支援に関するイベント'),

('movement',   '移動',     '移動・歩行・付き添いに関するイベント'),

('behavior',   '行動',     '利用者の行動・様子に関するイベント'),

('meal',       '食事',     '食事・水分摂取'),

('vital',      'バイタル', '体温・血圧・脈拍など'),

('cleaning',   '清潔',     '清拭・入浴・整容'),

('medication', '服薬',     '服薬・投薬'),

('activity',   '活動',     'レクリエーション・作業'),

('health',     '健康',     '体調・受診・疾病'),

('incident',   '事故',     '事故・ヒヤリハット'),

('communication','コミュニケーション','会話・相談・家族連携'),

('environment','環境',     '居室・環境・設備'),

('other',      'その他',   '分類未定');
