# 011 RISEN State Engine Architecture

**Version:** 1.0  
**Status:** Draft  
**Last Updated:** 2026-07-08

---

# 1. Purpose

This document defines the State Engine architecture of RISEN.

The State Engine transforms Knowledge Timeline into User State.

RISEN does not aim to merely store records.

RISEN aims to understand changes in the user's condition over time.

---

# 2. Background

Care and welfare support requires understanding not only what happened, but how the user's condition is changing.

Individual observations are important, but they are only points.

A timeline of observations creates lines.

State emerges from these lines.

```text
Observation
      ↓
Knowledge Graph
      ↓
Knowledge Timeline
      ↓
State Engine
      ↓
User State
```

---

# 3. Definition of State

State represents the current condition of a user derived from accumulated observations.

State is not a single event.

State is a pattern extracted from multiple observations.

Examples:

```text
sleep: unstable

nutrition: monitoring_required

hydration: dehydration_watch

adl: partial_support

medical: attention_required
```

---

# 4. Why State Is Needed

AI should not reason only from event counts.

For example:

```text
バイタル確認: 32
医療的注意: 35
脱水リスク: 8
```

These counts are useful, but they do not fully explain the user's condition.

State converts counts and timelines into meaningful labels.

```text
medical_attention_required

dehydration_watch

nutrition_monitoring

adl_monitoring
```

This allows AI, dashboards, and care professionals to understand the user's condition more easily.

---

# 5. Position in RISEN Architecture

The State Engine sits between Knowledge Timeline and AI Reasoning.

```text
Observation
      ↓
Event Mapper
      ↓
Event Type
      ↓
Knowledge Graph
      ↓
Knowledge Timeline
      ↓
State Engine
      ↓
State Transition
      ↓
AI Reasoning
      ↓
Recommendation
      ↓
Dashboard
```

---

# 6. Inputs

The State Engine consumes:

- Knowledge Timeline
- Knowledge Counts
- Event Type Counts
- Risk Counts
- Narrative Signals
- Recent Observations

These inputs are generated from Observation and Knowledge Graph.

---

# 7. Outputs

The State Engine produces User State.

Example:

```json
{
  "user_id": "user-id",
  "generated_at": "2026-07-08T00:00:00Z",
  "state": {
    "event_type_counts": {
      "バイタル": 32,
      "排泄": 10
    },
    "knowledge_counts": {
      "医療的注意": 35,
      "脱水リスク": 8
    },
    "risk_counts": {
      "low": 72
    },
    "signals": []
  }
}
```

The analyzed state converts this into care-oriented labels.

```json
{
  "state_labels": [
    "medical_attention_required",
    "dehydration_watch",
    "nutrition_monitoring",
    "adl_monitoring"
  ],
  "attention_points": [
    "医療的注意に関連するObservationが多い",
    "脱水リスクに関連するObservationが複数ある"
  ],
  "risk_level": "medium",
  "confidence": 0.8
}
```

---

# 8. State Labels

State Labels are reusable machine-readable labels.

Examples:

```text
medical_attention_required

dehydration_watch

nutrition_monitoring

adl_monitoring

sleep_unstable

mobility_support_required

behavior_monitoring_required

rights_protection_attention
```

State Labels allow AI and Dashboard to share the same understanding.

---

# 9. State Transition

State Transition represents change over time.

State alone describes the current condition.

State Transition describes direction.

Examples:

```text
sleep: stable → unstable

nutrition: stable → declining

hydration: sufficient → dehydration_watch

adl: independent → partial_support
```

State Transition is essential for early detection.

The goal is not only to know the current condition, but to understand how the condition is changing.

---

# 10. Relationship with AI Reasoning

AI should reason from State, not only raw observations.

```text
Knowledge Timeline
      ↓
State Engine
      ↓
Analyzed State
      ↓
AI Reasoning
```

AI uses State to generate:

- current state summaries
- attention points
- possible risks
- recommended care
- additional observations

AI must not diagnose or make final decisions.

AI supports professionals by explaining patterns derived from Observation.

---

# 11. Relationship with Dashboard

Dashboards can visualize State directly.

Examples:

- Medical attention level
- Hydration watch
- ADL monitoring
- Nutrition status
- Behavior monitoring
- Risk trend

This allows dashboards to show meaningful user conditions rather than raw event counts.

---

# 12. Relationship with Behavior Intelligence Engine

The State Engine is the foundation of Behavior Intelligence Engine.

Behavior does not usually occur in isolation.

Behavior often appears after changes in state.

Example:

```text
Sleep becomes unstable
      ↓
Meal intake decreases
      ↓
Refusal increases
      ↓
Behavior occurs
```

The Behavior Intelligence Engine detects repeated patterns before behavior events.

Therefore, State Engine must describe condition changes before behavior occurs.

---

# 13. Design Principles

The State Engine follows these principles.

1. State is derived from Observation.
2. State is based on Knowledge Timeline.
3. State is not a diagnosis.
4. State represents care-oriented condition labels.
5. State Transition is more important than static counts.
6. AI reasons from State but does not replace professional judgment.
7. Dashboard should visualize State, not only raw records.
8. State Engine grows through master data and rules before model complexity.

---

# 14. Current Implementation

Current implemented functions include:

```text
buildKnowledgeTimelineByUser()

summarizeKnowledgeTimeline()

buildUserState()

analyzeUserState()

buildAIReasoningInput()
```

Current State Engine supports:

- event type aggregation
- knowledge aggregation
- risk aggregation
- narrative signal aggregation
- state label generation
- attention point generation
- AI input generation

---

# 15. Future Evolution

Future enhancements include:

- domain-specific State definitions
- trend detection
- time-window comparison
- behavior-trigger pattern detection
- user-specific baseline learning
- dashboard-ready State snapshots
- AI-assisted State explanation

Expected future model:

```text
Observation
      ↓
Knowledge Graph
      ↓
Knowledge Timeline
      ↓
State
      ↓
State Transition
      ↓
Trigger Detection
      ↓
AI Reasoning
      ↓
Care Recommendation
```

---

# 16. Conclusion

The State Engine is the layer that turns accumulated observations into an understandable user condition.

Observation captures what happened.

Knowledge explains what it means.

Timeline shows when it happened.

State explains what condition is emerging.

AI reasons from State to support care professionals.

RISEN becomes valuable not only by recording events, but by helping people notice changes before they become serious.
