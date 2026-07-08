-- ==========================================
-- RISEN Knowledge OS
-- Master Data
-- event_type_knowledge
-- ==========================================

INSERT INTO event_type_knowledge
(event_type_id, knowledge_node_id)
VALUES

-- ==========================================
-- Sleep
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'sleep'),
  (SELECT id FROM knowledge_nodes WHERE code = 'sleep_rhythm')
),

(
  (SELECT id FROM event_types WHERE code = 'sleep'),
  (SELECT id FROM knowledge_nodes WHERE code = 'daily_routine')
),

-- ==========================================
-- Excretion
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'excretion'),
  (SELECT id FROM knowledge_nodes WHERE code = 'excretion_support')
),

(
  (SELECT id FROM event_types WHERE code = 'excretion'),
  (SELECT id FROM knowledge_nodes WHERE code = 'adl')
),

-- ==========================================
-- Movement
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'movement'),
  (SELECT id FROM knowledge_nodes WHERE code = 'mobility')
),

(
  (SELECT id FROM event_types WHERE code = 'movement'),
  (SELECT id FROM knowledge_nodes WHERE code = 'fall_risk')
),

(
  (SELECT id FROM event_types WHERE code = 'movement'),
  (SELECT id FROM knowledge_nodes WHERE code = 'safety_monitoring')
),

-- ==========================================
-- Location Confirmation
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'location_confirmation'),
  (SELECT id FROM knowledge_nodes WHERE code = 'location_confirmation')
),

(
  (SELECT id FROM event_types WHERE code = 'location_confirmation'),
  (SELECT id FROM knowledge_nodes WHERE code = 'monitoring_required')
),

-- ==========================================
-- Behavior
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'behavior'),
  (SELECT id FROM knowledge_nodes WHERE code = 'behavior_observation')
),

(
  (SELECT id FROM event_types WHERE code = 'behavior'),
  (SELECT id FROM knowledge_nodes WHERE code = 'emotional_state')
),

-- ==========================================
-- Meal
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'meal'),
  (SELECT id FROM knowledge_nodes WHERE code = 'meal_intake')
),

(
  (SELECT id FROM event_types WHERE code = 'meal'),
  (SELECT id FROM knowledge_nodes WHERE code = 'nutrition')
),

-- ==========================================
-- Hydration
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'hydration'),
  (SELECT id FROM knowledge_nodes WHERE code = 'hydration')
),

(
  (SELECT id FROM event_types WHERE code = 'hydration'),
  (SELECT id FROM knowledge_nodes WHERE code = 'nutrition')
),

(
  (SELECT id FROM event_types WHERE code = 'hydration'),
  (SELECT id FROM knowledge_nodes WHERE code = 'dehydration_risk')
),

-- ==========================================
-- Medication
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'medication'),
  (SELECT id FROM knowledge_nodes WHERE code = 'medication_management')
),

(
  (SELECT id FROM event_types WHERE code = 'medication'),
  (SELECT id FROM knowledge_nodes WHERE code = 'medical_attention')
),

-- ==========================================
-- Hygiene
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'hygiene'),
  (SELECT id FROM knowledge_nodes WHERE code = 'oral_care')
),

(
  (SELECT id FROM event_types WHERE code = 'hygiene'),
  (SELECT id FROM knowledge_nodes WHERE code = 'hygiene')
),

(
  (SELECT id FROM event_types WHERE code = 'hygiene'),
  (SELECT id FROM knowledge_nodes WHERE code = 'adl')
),

-- ==========================================
-- Bathing
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'bathing'),
  (SELECT id FROM knowledge_nodes WHERE code = 'bathing')
),

(
  (SELECT id FROM event_types WHERE code = 'bathing'),
  (SELECT id FROM knowledge_nodes WHERE code = 'hygiene')
),

(
  (SELECT id FROM event_types WHERE code = 'bathing'),
  (SELECT id FROM knowledge_nodes WHERE code = 'adl')
),

-- ==========================================
-- Vital
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'vital'),
  (SELECT id FROM knowledge_nodes WHERE code = 'vital_monitoring')
),

(
  (SELECT id FROM event_types WHERE code = 'vital'),
  (SELECT id FROM knowledge_nodes WHERE code = 'medical_attention')
),

-- ==========================================
-- Health
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'health'),
  (SELECT id FROM knowledge_nodes WHERE code = 'medical_attention')
),

(
  (SELECT id FROM event_types WHERE code = 'health'),
  (SELECT id FROM knowledge_nodes WHERE code = 'pain_observation')
),

-- ==========================================
-- Incident
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'incident'),
  (SELECT id FROM knowledge_nodes WHERE code = 'incident')
),

(
  (SELECT id FROM event_types WHERE code = 'incident'),
  (SELECT id FROM knowledge_nodes WHERE code = 'fall_risk')
),

(
  (SELECT id FROM event_types WHERE code = 'incident'),
  (SELECT id FROM knowledge_nodes WHERE code = 'injury_risk')
),

(
  (SELECT id FROM event_types WHERE code = 'incident'),
  (SELECT id FROM knowledge_nodes WHERE code = 'incident_review_support')
),

-- ==========================================
-- Communication
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'communication'),
  (SELECT id FROM knowledge_nodes WHERE code = 'communication')
),

(
  (SELECT id FROM event_types WHERE code = 'communication'),
  (SELECT id FROM knowledge_nodes WHERE code = 'family_contact')
),

-- ==========================================
-- Activity
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'activity'),
  (SELECT id FROM knowledge_nodes WHERE code = 'adl')
),

-- ==========================================
-- Support
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'support'),
  (SELECT id FROM knowledge_nodes WHERE code = 'adl')
),

-- ==========================================
-- Physical Restraint
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'physical_restraint'),
  (SELECT id FROM knowledge_nodes WHERE code = 'physical_restraint')
),

(
  (SELECT id FROM event_types WHERE code = 'physical_restraint'),
  (SELECT id FROM knowledge_nodes WHERE code = 'behavioral_restriction')
),

(
  (SELECT id FROM event_types WHERE code = 'physical_restraint'),
  (SELECT id FROM knowledge_nodes WHERE code = 'rights_protection')
),

(
  (SELECT id FROM event_types WHERE code = 'physical_restraint'),
  (SELECT id FROM knowledge_nodes WHERE code = 'rights_review_support')
),

(
  (SELECT id FROM event_types WHERE code = 'physical_restraint'),
  (SELECT id FROM knowledge_nodes WHERE code = 'committee_review_support')
);
