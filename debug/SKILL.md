---
name: debug
description: Systematically debug an issue by analyzing error messages, stack traces, logs, and code paths. Use when the user reports a bug, error, or unexpected behavior.
disable-model-invocation: true
---

# Debug Skill

Systematically diagnose and resolve bugs and errors.

## Input

`$ARGUMENTS` may contain:
- Error message or stack trace
- Description of unexpected behavior
- File path or function name where issue occurs

## Debugging Workflow

### Step 1: Reproduce & Understand
- Parse the error message/stack trace to identify the failure point
- Identify the exact file and line number
- Read the relevant source code

### Step 2: Trace the Root Cause
- Follow the call stack from the error point upward
- Check recent changes to affected files (`git log -10 --oneline -- <file>`)
- Look for common patterns:
  - Null/undefined access
  - Type mismatches
  - Missing imports or dependencies
  - Race conditions
  - Configuration issues
  - Environment-specific problems

### Step 3: Analyze Context
- Check related tests for expected behavior
- Read surrounding code for assumptions
- Look at similar patterns elsewhere in the codebase

### Step 4: Propose Fix
- Identify the minimal change needed to fix the issue
- Consider side effects of the fix
- Verify the fix doesn't break related functionality

### Step 5: Verify
- If tests exist, suggest running them
- If no tests exist, suggest a manual verification step

## Output Format

```
## Bug Analysis

**Error:** <error summary>
**Root Cause:** <explanation>
**Location:** file_path:line_number

## Fix

<code changes with explanation>

## Verification

<how to verify the fix works>
```

## Important
- Do NOT guess. If you need more information, ask the user.
- Prefer minimal fixes over refactoring.
- Always explain WHY the bug occurred, not just how to fix it.
