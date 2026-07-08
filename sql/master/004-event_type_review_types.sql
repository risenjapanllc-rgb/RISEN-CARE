-- ==========================================
-- RISEN Knowledge OS
-- Master Data
-- event_type_review_types
-- ==========================================

INSERT INTO event_type_review_types
(event_type_id, review_type_id)
VALUES

-- ==========================================
-- Incident
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'incident'),
  (SELECT id FROM review_types WHERE code = 'incident_review')
),

-- ==========================================
-- Health
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'health'),
  (SELECT id FROM review_types WHERE code = 'medical_review')
),

(
  (SELECT id FROM event_types WHERE code = 'medication'),
  (SELECT id FROM review_types WHERE code = 'medical_review')
),

(
  (SELECT id FROM event_types WHERE code = 'vital'),
  (SELECT id FROM review_types WHERE code = 'medical_review')
),

-- ==========================================
-- Physical Restraint / Behavioral Restriction
-- ==========================================

(
  (SELECT id FROM event_types WHERE code = 'physical_restraint'),
  (SELECT id FROM review_types WHERE code = 'rights_protection_review')
),

(
  (SELECT id FROM event_types WHERE code = 'physical_restraint'),
  (SELECT id FROM review_types WHERE code = 'medical_review')
),

(
  (SELECT id FROM event_types WHERE code = 'physical_restraint'),
  (SELECT id FROM review_types WHERE code = 'committee_review')
);
  '委員会レビュー',
  '委員会での審議・報告・改善活動に関するレビュー'
);
