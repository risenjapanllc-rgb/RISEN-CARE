# ADR-204: Data Integrity

**Status:** Accepted

**Date:** 2026-07-17

---

## Decision

RISEN CARE adopts a **Data Integrity First** architecture.

Every synchronization process, database update, AI-assisted workflow,
and future system enhancement shall comply with the principles defined
in this document.

---

# Development Checklist

Every new synchronization process, database update, or AI-assisted data operation shall satisfy the following requirements before implementation.

## Synchronization

- [ ] `source_record_id` is the only synchronization key.
- [ ] Synchronization never depends on spreadsheet row numbers.
- [ ] Synchronization never depends on row order.
- [ ] Every update targets exactly one record.

## Validation

- [ ] `source_record_id` exists.
- [ ] `source_record_id` is unique in the spreadsheet.
- [ ] `source_record_id` uniquely exists in Supabase.
- [ ] Required fields are present.
- [ ] Resident identity has been verified when applicable.

## Safety

- [ ] No data is inferred or guessed.
- [ ] Any ambiguity causes the synchronization to stop.
- [ ] Duplicate IDs stop the entire synchronization.
- [ ] Missing IDs stop the affected update.
- [ ] Resident records cannot be corrupted under any circumstance.

## Traceability

- [ ] Synchronization is logged.
- [ ] Errors are logged.
- [ ] Updated record counts are verified.
- [ ] The implementation complies with ADR-204.

---

> **When in doubt, stop. Never guess. Never corrupt resident data.**

If any checklist item cannot be satisfied, the implementation shall not proceed.

---

# Purpose

RISEN CARE handles care records that directly affect the safety and quality of care.

Therefore, the highest priority of the system is **data integrity**.

The system shall always prioritize:

- Correctness over speed
- Reliability over convenience
- Traceability over automation

No function may compromise the integrity of resident records.

---

# Design Principles

## 1. Single Source of Truth

The Daily Record spreadsheet is the only source of operational data.

```text
Daily Record (Spreadsheet)
            │
            ▼
      Google Apps Script
            │
            ▼
        Supabase
            │
            ▼
AI / Search / Dashboard
```

Supabase is a synchronized database.

Operational users should update the spreadsheet, not the database directly.

---

## 2. Primary Synchronization Key

The only synchronization key is:

```text
events.source_record_id
```

No synchronization process may use:

- Spreadsheet row number
- Record order
- Resident name only
- Date/time only

Every update must be performed by matching:

```text
DailyRecord.A
        ==
events.source_record_id
```

---

## 3. Row Order Independence

The system must remain correct even if:

- rows are inserted
- rows are deleted
- blank rows exist
- rows are sorted
- filters are applied

Synchronization must never depend on physical row position.

---

## 4. Validation Before Update

Before every synchronization, GAS shall verify:

- source_record_id exists
- source_record_id is unique in the spreadsheet
- source_record_id uniquely exists in Supabase
- required fields are present
- resident identity matches (when available)

If any validation fails,

**the synchronization must stop.**

No partial guessing is allowed.

---

## 5. Fail Safe

When uncertainty exists,

the system must stop rather than continue.

Examples:

- duplicate source_record_id
- missing source_record_id
- multiple matching records
- resident mismatch
- invalid data

Safety has higher priority than automation.

---

## 6. No Guessing

Neither AI nor GAS may infer data.

Examples of prohibited behavior:

- assuming similar resident names are identical
- selecting the nearest matching record
- updating based on row position
- automatically resolving duplicate IDs

Human confirmation is required whenever ambiguity exists.

---

## 7. Audit Trail

Every synchronization shall leave an audit record.

Recommended items:

- execution time
- synchronization version
- operator
- updated records
- skipped records
- failed records
- execution result

Future versions should additionally record:

- before values
- after values
- rollback information

---

## 8. Logging

Synchronization logs must be retained.

Logs should make it possible to answer:

- What changed?
- When did it change?
- Who executed the synchronization?
- Which version executed it?
- Why did synchronization stop?

---

## 9. Future Enhancements

The following safety features are planned.

- Unique Constraint on `source_record_id`
- Transaction-based synchronization
- Rollback capability
- Version history
- Complete audit history
- Automatic integrity verification

---

## 10. Human-Centered Verification

Automation shall support human judgment, not replace it.

Before modifying resident records, the system should present sufficient information for human verification whenever practical.

Typical verification items include:

- source_record_id
- resident name
- event date and time
- record summary
- staff name

Users should be able to confirm that the intended record is being updated.

The system shall never hide uncertainty from the operator.

---

# Fundamental Principle

The following principle governs every synchronization process,
database update, and future system enhancement in RISEN CARE.

> **If correctness cannot be guaranteed, the system shall stop rather than risk corrupting resident data.**

This principle overrides all implementation decisions,
performance optimizations, and automation features.

Protecting the integrity of resident records is always the highest priority of RISEN CARE.
