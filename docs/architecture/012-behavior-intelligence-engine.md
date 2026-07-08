# 012 Behavior Intelligence Engine

**Version:** 1.0  
**Status:** Draft  
**Last Updated:** 2026-07-08

---

# 1. Purpose

This document defines the Behavior Intelligence Engine (BIE) of RISEN.

The purpose of BIE is not to explain behavior after it occurs.

Its purpose is to identify recurring patterns that precede behavior, enabling earlier awareness and more appropriate support.

RISEN does not attempt to determine a single cause of behavior.

RISEN helps care professionals recognize patterns that may be related to behavior.

---

# 2. Background

The origin of RISEN came from a question raised in a care facility.

> "Sometimes a user suddenly becomes aggressive, and staff must immediately respond. If we could understand what tends to happen before those situations, perhaps we could support the person earlier."

This question defines the purpose of the Behavior Intelligence Engine.

Behavior is not treated as an isolated event.

Behavior is understood as one point within a sequence of observations and state changes.

---

# 3. Basic Concept

Behavior rarely appears without context.

It is usually preceded by multiple changes.

```text
Observation
      ↓
Knowledge
      ↓
State
      ↓
State Transition
      ↓
Behavior
```

BIE focuses on everything before the behavior.

---

# 4. What BIE Detects

The engine detects recurring patterns before behavior events.

Examples include:

- sleep instability
- reduced meal intake
- dehydration risk
- increased refusal
- pain-related observations
- environmental changes
- medication changes
- communication difficulties
- increased caregiver assistance
- emotional instability

No single observation explains behavior.

The combination and sequence are important.

---

# 5. Trigger Candidate

RISEN does not determine causes.

Instead it generates Trigger Candidates.

Example:

```text
Behavior

↓

Possible Trigger Candidates

・Sleep deterioration

・Meal intake reduction

・Repeated refusal

・Environmental stimulation
```

Trigger Candidates represent hypotheses rather than conclusions.

---

# 6. Behavior Timeline

Behavior should always be analyzed together with preceding observations.

```text
Observation Timeline

↓

Knowledge Timeline

↓

State Timeline

↓

Behavior Timeline
```

The objective is to understand what changed before behavior occurred.

---

# 7. Pattern Detection

BIE searches for repeated sequences.

Example:

```text
Sleep unstable

↓

Meal intake decreased

↓

Refusal increased

↓

Aggressive behavior
```

If similar sequences occur repeatedly, the pattern becomes more reliable.

RISEN never assumes a single occurrence represents a rule.

---

# 8. Pattern Confidence

Every detected pattern includes confidence.

Example:

```json
{
  "pattern": "sleep → refusal → behavior",
  "occurrences": 6,
  "confidence": 0.91
}
```

Confidence grows through repeated observations.

Confidence does not represent certainty.

---

# 9. Recommendation Strategy

RISEN does not predict behavior with certainty.

Instead it recommends additional observation.

Example:

```text
Previous behavior events were often preceded by:

・Sleep instability

・Reduced hydration

・Repeated refusal

Consider observing these areas more closely.
```

Recommendations support professional judgment.

---

# 10. Relationship with State Engine

The State Engine describes current condition.

BIE describes recurring changes leading toward behavior.

```text
Observation

↓

Knowledge

↓

State

↓

State Transition

↓

Behavior Intelligence Engine

↓

Recommendation
```

---

# 11. Relationship with AI

AI reasons using the outputs of BIE.

AI should explain:

- observed patterns
- confidence
- supporting observations
- possible care approaches

AI should never state:

"This behavior happened because..."

Instead AI should explain:

"Previous behavior events shared similar preceding patterns."

---

# 12. Explainability

Every recommendation should be traceable.

```text
Recommendation

↓

Pattern

↓

State Transition

↓

Knowledge

↓

Observation
```

Care professionals must always understand why RISEN generated a recommendation.

Explainability is a core design principle.

---

# 13. Design Principles

Behavior Intelligence Engine follows these principles.

1. Behavior is an outcome, not a starting point.
2. Behavior is interpreted through Observation and State.
3. Trigger Candidates are hypotheses.
4. Multiple observations are more important than isolated events.
5. Repeated patterns increase confidence.
6. AI supports professionals rather than replacing them.
7. Recommendations should always be explainable.
8. Human judgment remains the final decision.

---

# 14. Future Evolution

Future versions may include:

- temporal pattern mining
- individual baseline learning
- personalized trigger models
- environmental factor integration
- staff intervention history
- intervention effectiveness analysis
- behavior similarity search
- preventive care recommendations

---

# 15. RISEN Philosophy

RISEN does not ask:

> "Why did this behavior happen?"

RISEN asks:

> "What tends to happen before this behavior?"

This distinction is fundamental.

The objective is not retrospective explanation.

The objective is earlier understanding.

---

# 16. Conclusion

Behavior Intelligence Engine is the highest reasoning layer in RISEN.

Observation records what happened.

Knowledge explains what it means.

State describes the current condition.

State Transition describes change.

Behavior Intelligence Engine identifies recurring patterns before behavior occurs.

AI transforms these patterns into understandable recommendations for care professionals.

The ultimate goal is not prediction.

The ultimate goal is earlier understanding, better support, and improved quality of life for the people receiving care.
