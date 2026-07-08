-- ==========================================
-- RISEN Knowledge OS
-- Master Data
-- knowledge_relations
-- ==========================================

INSERT INTO knowledge_relations
(from_node_id, relation_type, to_node_id, description)
VALUES

-- Safety / Incident
(
  (SELECT id FROM knowledge_nodes WHERE code = 'incident'),
  'indicates',
  (SELECT id FROM knowledge_nodes WHERE code = 'incident_review_support'),
  '事故は事故レビュー支援につながる'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'fall_risk'),
  'increases',
  (SELECT id FROM knowledge_nodes WHERE code = 'injury_risk'),
  '転倒リスクは外傷リスクを高める'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'mobility'),
  'affects',
  (SELECT id FROM knowledge_nodes WHERE code = 'fall_risk'),
  '移動能力は転倒リスクに影響する'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'safety_monitoring'),
  'prevents',
  (SELECT id FROM knowledge_nodes WHERE code = 'fall_risk'),
  '安全確認は転倒リスクの予防につながる'
),

-- Medical
(
  (SELECT id FROM knowledge_nodes WHERE code = 'medical_attention'),
  'indicates',
  (SELECT id FROM knowledge_nodes WHERE code = 'medical_review_support'),
  '医療的注意は医療レビュー支援につながる'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'vital_monitoring'),
  'supports',
  (SELECT id FROM knowledge_nodes WHERE code = 'medical_attention'),
  'バイタル確認は医療的注意を支える'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'medication_management'),
  'supports',
  (SELECT id FROM knowledge_nodes WHERE code = 'medical_attention'),
  '服薬管理は医療的注意を支える'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'hydration'),
  'prevents',
  (SELECT id FROM knowledge_nodes WHERE code = 'dehydration_risk'),
  '水分摂取は脱水リスクの予防につながる'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'dehydration_risk'),
  'indicates',
  (SELECT id FROM knowledge_nodes WHERE code = 'medical_attention'),
  '脱水リスクは医療的注意につながる'
),

-- Rights Protection
(
  (SELECT id FROM knowledge_nodes WHERE code = 'physical_restraint'),
  'indicates',
  (SELECT id FROM knowledge_nodes WHERE code = 'rights_review_support'),
  '身体拘束は権利擁護レビュー支援につながる'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'behavioral_restriction'),
  'indicates',
  (SELECT id FROM knowledge_nodes WHERE code = 'rights_review_support'),
  '行動制限は権利擁護レビュー支援につながる'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'rights_protection'),
  'supports',
  (SELECT id FROM knowledge_nodes WHERE code = 'abuse_prevention'),
  '権利擁護は虐待防止を支える'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'consent_confirmation'),
  'supports',
  (SELECT id FROM knowledge_nodes WHERE code = 'rights_protection'),
  '同意確認は権利擁護を支える'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'physical_restraint'),
  'indicates',
  (SELECT id FROM knowledge_nodes WHERE code = 'committee_review_support'),
  '身体拘束は委員会レビュー支援につながる'
),

-- Monitoring / Behavior
(
  (SELECT id FROM knowledge_nodes WHERE code = 'location_confirmation'),
  'supports',
  (SELECT id FROM knowledge_nodes WHERE code = 'monitoring_required'),
  '所在確認は見守り必要性の判断を支える'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'wandering_risk'),
  'increases',
  (SELECT id FROM knowledge_nodes WHERE code = 'monitoring_required'),
  '離設・徘徊リスクは見守り必要性を高める'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'agitation'),
  'indicates',
  (SELECT id FROM knowledge_nodes WHERE code = 'behavior_observation'),
  '不穏は行動観察につながる'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'behavior_observation'),
  'supports',
  (SELECT id FROM knowledge_nodes WHERE code = 'monitoring_required'),
  '行動観察は見守り必要性の判断を支える'
),

-- ADL
(
  (SELECT id FROM knowledge_nodes WHERE code = 'oral_care'),
  'supports',
  (SELECT id FROM knowledge_nodes WHERE code = 'hygiene'),
  '口腔ケアは清潔保持を支える'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'hygiene'),
  'supports',
  (SELECT id FROM knowledge_nodes WHERE code = 'adl'),
  '清潔保持はADLを支える'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'bathing'),
  'supports',
  (SELECT id FROM knowledge_nodes WHERE code = 'hygiene'),
  '入浴は清潔保持を支える'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'excretion_support'),
  'supports',
  (SELECT id FROM knowledge_nodes WHERE code = 'adl'),
  '排泄支援はADLを支える'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'mobility'),
  'supports',
  (SELECT id FROM knowledge_nodes WHERE code = 'adl'),
  '移動能力はADLを支える'
),

-- Nutrition / Sleep / Communication
(
  (SELECT id FROM knowledge_nodes WHERE code = 'meal_intake'),
  'supports',
  (SELECT id FROM knowledge_nodes WHERE code = 'nutrition'),
  '食事摂取は栄養を支える'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'hydration'),
  'supports',
  (SELECT id FROM knowledge_nodes WHERE code = 'nutrition'),
  '水分摂取は栄養状態を支える'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'sleep_rhythm'),
  'supports',
  (SELECT id FROM knowledge_nodes WHERE code = 'daily_routine'),
  '睡眠リズムは生活リズムを支える'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'communication'),
  'supports',
  (SELECT id FROM knowledge_nodes WHERE code = 'emotional_state'),
  'コミュニケーションは心理状態の理解を支える'
),

(
  (SELECT id FROM knowledge_nodes WHERE code = 'family_contact'),
  'supports',
  (SELECT id FROM knowledge_nodes WHERE code = 'communication'),
  '家族連携はコミュニケーションを支える'
);
