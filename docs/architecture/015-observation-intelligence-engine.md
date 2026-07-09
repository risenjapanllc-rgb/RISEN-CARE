# 015 Observation Intelligence Engine

**Version:** 1.0  
**Status:** Draft  
**Last Updated:** 2026-07-09

---

# 1. Purpose

This document defines the Observation Intelligence Engine of RISEN.

The Observation Intelligence Engine transforms accumulated observations into patterns, state changes, trigger candidates, and care recommendations.

RISEN is not designed only to record what happened.

RISEN is designed to help people understand what tends to happen before meaningful changes occur.

---

# 2. Core Concept

RISEN treats Observation as the beginning of understanding.

```text
Observation
      ↓
Knowledge
      ↓
State
      ↓
Sequence
      ↓
Episode
      ↓
Pattern
      ↓
Trigger Candidate
      ↓
AI Reasoning
      ↓
Care Recommendation
```

Each layer adds structure and meaning.

AI does not start from raw text alone.

AI reasons from structured Observation Intelligence.

---

# 3. Why Observation Intelligence Is Needed

Care professionals can understand individual situations through experience.

However, it is difficult for humans to discover patterns across:

- many users
- long periods of time
- thousands of observations
- multiple domains
- subtle changes
- repeated sequences

Observation Intelligence helps discover patterns that are difficult for humans to notice.

---

# 4. From Observation to Intelligence

## Observation

A single recorded fact.

Example:

```text
歯磨き
```

---

## Knowledge

Meaning attached to Observation.

Example:

```text
歯磨き
      ↓
口腔ケア
      ↓
清潔保持
      ↓
ADL
```

---

## State

The user's current condition derived from accumulated observations.

Example:

```text
medical_attention_required

dehydration_watch

nutrition_monitoring
```

---

## Sequence

A time-ordered flow of observations.

Example:

```text
バイタル
      ↓
水分
      ↓
排泄
      ↓
服薬
```

---

## Episode

A meaningful group of observations within a time window.

Example:

```text
Episode 1

バイタル
      ↓
清潔
      ↓
排泄
```

---

## Pattern

A repeated structure found across sequences or episodes.

Example:

```text
排泄
      ↓
バイタル
```

---

## Trigger Candidate

A pattern that may appear before a behavior, incident, or meaningful state change.

Example:

```text
睡眠不安定
      ↓
食事量低下
      ↓
拒否増加
      ↓
Behavior
```

Trigger Candidates are hypotheses.

They are not confirmed causes.

---

# 5. Pattern Types

RISEN handles multiple kinds of patterns.

## 5.1 Frequency Pattern

A pattern based on occurrence count.

Example:

```text
医療的注意: 21
バイタル確認: 19
ADL: 9
```

---

## 5.2 Transition Pattern

A pattern based on direct transition.

Example:

```text
バイタル → バイタル

排泄 → バイタル

水分 → 排泄
```

---

## 5.3 Sequence Pattern

A pattern based on ordered observations.

Example:

```text
水分
      ↓
排泄
      ↓
バイタル
```

---

## 5.4 Episode Pattern

A pattern based on repeated episode structures.

Example:

```text
Episode A

バイタル
      ↓
清潔
      ↓
排泄
```

---

## 5.5 Trigger Pattern

A pattern repeatedly observed before behavior or incidents.

Example:

```text
睡眠不安定
      ↓
拒否
      ↓
興奮
```

Trigger Patterns are the foundation of preventive support.

---

# 6. Relationship with Behavior Intelligence Engine

The Behavior Intelligence Engine uses Observation Intelligence.

```text
Observation Intelligence Engine
      ↓
Behavior Intelligence Engine
      ↓
Care Recommendation
```

Observation Intelligence discovers patterns.

Behavior Intelligence interprets patterns related to behavior.

---

# 7. Relationship with AI

AI is used after RISEN structures the data.

```text
Observation
      ↓
Knowledge
      ↓
State
      ↓
Episode
      ↓
Pattern
      ↓
AI Reasoning
```

AI helps explain:

- what patterns were found
- what they may mean
- what should be observed next
- what care options may be considered

AI must not:

- determine causes
- diagnose
- replace professionals
- make final decisions

---

# 8. Explainability

Every AI output must be traceable.

```text
Recommendation
      ↓
AI Reasoning
      ↓
Pattern
      ↓
Episode
      ↓
Sequence
      ↓
State
      ↓
Knowledge
      ↓
Observation
```

RISEN must always be able to explain why a recommendation was generated.

---

# 9. Current Implementation

Current implemented functions include:

```text
buildObservationSequence()

summarizeObservationSequence()

analyzeObservationTransitions()

buildPatternCandidates()

buildEpisodes()

summarizeEpisode()

analyzeEpisodePatterns()

createPatternAnalysisPrompt()

callOpenAIReasoning()
```

Current capabilities include:

- generating observation sequences
- summarizing sequences
- extracting transitions
- generating pattern candidates
- grouping observations into episodes
- summarizing episodes
- analyzing episode-level patterns
- generating AI prompts
- calling OpenAI for pattern explanation

---

# 10. Future Implementation

Future functions may include:

```text
buildObservationSequenceByPeriod()

buildActivity()

buildEpisodesByBehavior()

compareEpisodes()

findSimilarEpisodes()

findTriggerCandidates()

calculatePatternConfidence()

generateTriggerRecommendation()

evaluateInterventionEffect()
```

These functions will allow RISEN to detect recurring patterns before behavior, incidents, or state deterioration.

---

# 11. Design Principles

The Observation Intelligence Engine follows these principles.

1. Observation is the source of truth.
2. Intelligence emerges from accumulated observations.
3. Patterns are hypotheses, not conclusions.
4. Sequence and timing matter.
5. Episodes are more meaningful than isolated records.
6. AI explains patterns but does not decide.
7. Recommendations must be traceable.
8. Professionals remain responsible for interpretation and action.

---

# 12. Final Goal

The final goal is not prediction alone.

The final goal is earlier understanding.

RISEN should help professionals notice meaningful change before it becomes a crisis.

```text
Observe.
Understand.
Care.
```

---

# 13. Conclusion

The Observation Intelligence Engine is the reasoning foundation of RISEN.

It transforms observations into structured intelligence through Knowledge, State, Sequence, Episode, and Pattern.

This enables AI and professionals to work together.

AI discovers patterns.

People create meaning.

Together they enable better care.
