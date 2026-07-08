-- ==========================================
-- RISEN Knowledge OS
-- Master Data
-- review_types
-- ==========================================

INSERT INTO review_types
(code, name, description)
VALUES

(
  'incident_review',
  '事故レビュー',
  '事故・ヒヤリハット・転倒・転落等の事故対応レビュー'
),

(
  'medical_review',
  '医療レビュー',
  '医療的判断・健康状態・受診・服薬等に関するレビュー'
),

(
  'rights_protection_review',
  '権利擁護レビュー',
  '身体拘束・虐待防止・権利擁護に関するレビュー'
),

(
  'committee_review',
  '委員会レビュー',
  '委員会での審議・報告・改善活動に関するレビュー'
);
