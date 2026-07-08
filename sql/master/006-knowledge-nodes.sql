-- ==========================================
-- RISEN Knowledge OS
-- Master Data
-- knowledge_nodes
-- ==========================================

INSERT INTO knowledge_nodes
(code, name, category_id, description)
VALUES

-- Safety
(
  'fall_risk',
  '転倒リスク',
  (SELECT id FROM knowledge_categories WHERE code = 'safety'),
  '転倒・転落につながる可能性'
),

(
  'injury_risk',
  '外傷リスク',
  (SELECT id FROM knowledge_categories WHERE code = 'safety'),
  'けが・打撲・外傷につながる可能性'
),

(
  'incident',
  '事故',
  (SELECT id FROM knowledge_categories WHERE code = 'safety'),
  '事故・ヒヤリハットに関するKnowledge'
),

(
  'wandering_risk',
  '離設・徘徊リスク',
  (SELECT id FROM knowledge_categories WHERE code = 'safety'),
  '所在不明・離設・徘徊につながる可能性'
),

-- Medical
(
  'medical_attention',
  '医療的注意',
  (SELECT id FROM knowledge_categories WHERE code = 'medical'),
  '医療的確認・判断が必要となる可能性'
),

(
  'vital_monitoring',
  'バイタル確認',
  (SELECT id FROM knowledge_categories WHERE code = 'medical'),
  '体温・血圧・脈拍・SpO2などの確認'
),

(
  'medication_management',
  '服薬管理',
  (SELECT id FROM knowledge_categories WHERE code = 'medical'),
  '服薬・投薬・薬剤確認に関するKnowledge'
),

(
  'pain_observation',
  '疼痛観察',
  (SELECT id FROM knowledge_categories WHERE code = 'medical'),
  '痛み・苦痛の有無に関する観察'
),

-- Rights Protection
(
  'rights_protection',
  '権利擁護',
  (SELECT id FROM knowledge_categories WHERE code = 'rights_protection'),
  '利用者の尊厳・権利を守るためのKnowledge'
),

(
  'physical_restraint',
  '身体拘束',
  (SELECT id FROM knowledge_categories WHERE code = 'rights_protection'),
  '身体拘束に関するKnowledge'
),

(
  'behavioral_restriction',
  '行動制限',
  (SELECT id FROM knowledge_categories WHERE code = 'rights_protection'),
  '行動の制限・自由の制限に関するKnowledge'
),

(
  'consent_confirmation',
  '同意確認',
  (SELECT id FROM knowledge_categories WHERE code = 'rights_protection'),
  '本人・家族・関係者の同意確認に関するKnowledge'
),

(
  'abuse_prevention',
  '虐待防止',
  (SELECT id FROM knowledge_categories WHERE code = 'rights_protection'),
  '虐待防止・不適切ケア防止に関するKnowledge'
),

-- Behavior Support
(
  'behavior_observation',
  '行動観察',
  (SELECT id FROM knowledge_categories WHERE code = 'behavior_support'),
  '利用者の行動・様子・変化に関する観察'
),

(
  'agitation',
  '不穏',
  (SELECT id FROM knowledge_categories WHERE code = 'behavior_support'),
  '落ち着きのなさ・不安定な状態に関するKnowledge'
),

(
  'emotional_state',
  '心理状態',
  (SELECT id FROM knowledge_categories WHERE code = 'behavior_support'),
  '表情・発言・感情変化に関するKnowledge'
),

-- Monitoring
(
  'location_confirmation',
  '所在確認',
  (SELECT id FROM knowledge_categories WHERE code = 'monitoring'),
  '居室・廊下・食堂など所在の確認'
),

(
  'monitoring_required',
  '見守り必要',
  (SELECT id FROM knowledge_categories WHERE code = 'monitoring'),
  '継続的な見守りが必要となる可能性'
),

(
  'safety_monitoring',
  '安全確認',
  (SELECT id FROM knowledge_categories WHERE code = 'monitoring'),
  '安全確保・危険予防のための確認'
),

-- ADL
(
  'adl',
  'ADL',
  (SELECT id FROM knowledge_categories WHERE code = 'adl'),
  '日常生活動作全般'
),

(
  'mobility',
  '移動能力',
  (SELECT id FROM knowledge_categories WHERE code = 'adl'),
  '歩行・移乗・移動に関する能力'
),

(
  'excretion_support',
  '排泄支援',
  (SELECT id FROM knowledge_categories WHERE code = 'adl'),
  '排泄・トイレ誘導・排泄介助に関するKnowledge'
),

(
  'hygiene',
  '清潔保持',
  (SELECT id FROM knowledge_categories WHERE code = 'adl'),
  '清潔・整容・身体清潔に関するKnowledge'
),

(
  'oral_care',
  '口腔ケア',
  (SELECT id FROM knowledge_categories WHERE code = 'adl'),
  '歯磨き・口腔内清潔に関するKnowledge'
),

(
  'bathing',
  '入浴',
  (SELECT id FROM knowledge_categories WHERE code = 'adl'),
  '入浴・清拭・身体清潔に関するKnowledge'
),

-- Nutrition
(
  'nutrition',
  '栄養',
  (SELECT id FROM knowledge_categories WHERE code = 'nutrition'),
  '食事・栄養状態に関するKnowledge'
),

(
  'meal_intake',
  '食事摂取',
  (SELECT id FROM knowledge_categories WHERE code = 'nutrition'),
  '食事量・摂取状況に関するKnowledge'
),

(
  'hydration',
  '水分摂取',
  (SELECT id FROM knowledge_categories WHERE code = 'nutrition'),
  '飲水・水分摂取に関するKnowledge'
),

(
  'dehydration_risk',
  '脱水リスク',
  (SELECT id FROM knowledge_categories WHERE code = 'nutrition'),
  '水分不足・脱水につながる可能性'
),

-- Sleep
(
  'sleep_rhythm',
  '睡眠リズム',
  (SELECT id FROM knowledge_categories WHERE code = 'sleep'),
  '就寝・起床・睡眠状態に関するKnowledge'
),

(
  'daily_routine',
  '生活リズム',
  (SELECT id FROM knowledge_categories WHERE code = 'sleep'),
  '日課・生活パターンに関するKnowledge'
),

-- Communication
(
  'communication',
  'コミュニケーション',
  (SELECT id FROM knowledge_categories WHERE code = 'communication'),
  '会話・意思疎通・相談に関するKnowledge'
),

(
  'family_contact',
  '家族連携',
  (SELECT id FROM knowledge_categories WHERE code = 'communication'),
  '家族への連絡・情報共有に関するKnowledge'
),

-- Environment
(
  'environment',
  '環境',
  (SELECT id FROM knowledge_categories WHERE code = 'environment'),
  '生活環境・居室・設備に関するKnowledge'
),

(
  'room_environment',
  '居室環境',
  (SELECT id FROM knowledge_categories WHERE code = 'environment'),
  '居室内の環境・安全確認に関するKnowledge'
),

-- Review Support
(
  'incident_review_support',
  '事故レビュー支援',
  (SELECT id FROM knowledge_categories WHERE code = 'safety'),
  '事故レビューにつながるKnowledge'
),

(
  'medical_review_support',
  '医療レビュー支援',
  (SELECT id FROM knowledge_categories WHERE code = 'medical'),
  '医療レビューにつながるKnowledge'
),

(
  'rights_review_support',
  '権利擁護レビュー支援',
  (SELECT id FROM knowledge_categories WHERE code = 'rights_protection'),
  '権利擁護レビューにつながるKnowledge'
),

(
  'committee_review_support',
  '委員会レビュー支援',
  (SELECT id FROM knowledge_categories WHERE code = 'rights_protection'),
  '委員会レビューにつながるKnowledge'
);
