# 204 Data Integrity

## Purpose

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

```
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

```
events.source_record_id
```

No synchronization process may use:

- Spreadsheet row number
- Record order
- Resident name only
- Date/time only

Every update must be performed by matching:

```
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

- Unique Constraint on source_record_id
- Transaction-based synchronization
- Rollback capability
- Version history
- Complete audit history
- Automatic integrity verification

---

# Core Principle

RISEN CARE prioritizes the integrity and traceability of care records over processing speed.

If correctness cannot be guaranteed,

**the system shall stop rather than risk corrupting resident data.**
