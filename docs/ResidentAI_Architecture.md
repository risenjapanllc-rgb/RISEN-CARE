# Resident AI Architecture

## Design Philosophy

RISEN CARE does not send raw care records directly to Generative AI.

Instead, RISEN CARE first structures care data into meaningful information.

Observation
    ↓
Observation Search
    ↓
Observation Summary
    ↓
Representative Observations
    ↓
Resident Memory
    ↓
Environment Context
    ↓
Resident AI

## Principle

AI should not interpret raw records.

RISEN CARE should transform raw care records into structured knowledge before AI reasoning.

This architecture improves:

- Accuracy
- Token efficiency
- Explainability
- Safety
- Scalability

# Resident AI Roadmap

## v3
- Observation Search
- Observation Summary
- Representative Observation
- Resident Memory
- Weather Context

## v3.1
- search_result_count
- representative_count
- Category normalization

## v4
Care Summary

## v5
Trend Analysis
