---
name: code-review
description: Perform a thorough code review on changed or specified files. Use when the user asks for a code review, PR review, or quality check on their code.
disable-model-invocation: true
---

# Code Review Skill

Perform a systematic, professional code review.

## Target

- If `$ARGUMENTS` is provided, review those specific files or paths
- If no arguments, review all uncommitted changes (`git diff` + `git diff --cached`)
- If in a PR context, review all changed files in the PR

## Review Checklist

For each file, analyze the following aspects:

### 1. Correctness
- Logic errors, off-by-one errors, null/undefined handling
- Race conditions and concurrency issues
- Edge cases not handled

### 2. Code Quality
- Readability and clarity of naming
- DRY violations (duplicated logic)
- Function/method length and complexity
- Appropriate abstraction level

### 3. Security
- Input validation at system boundaries
- SQL injection, XSS, command injection risks
- Sensitive data exposure (logs, error messages)
- Authentication/authorization gaps

### 4. Performance
- Unnecessary loops or redundant computations
- N+1 query patterns
- Memory leaks or unbounded growth
- Missing indexes on database queries

### 5. Testing
- Are changes covered by tests?
- Are edge cases tested?
- Are mocks/stubs appropriate?

## Output Format

For each issue found, report:

```
[SEVERITY] file_path:line_number
Issue: Brief description
Suggestion: How to fix
```

Severity levels:
- **CRITICAL** - Bugs, security vulnerabilities, data loss risks
- **WARNING** - Performance issues, code smells, potential problems
- **SUGGESTION** - Style improvements, better patterns, readability

### Summary
End with a summary table:
| Category | Critical | Warning | Suggestion |
|----------|----------|---------|------------|
| Correctness | N | N | N |
| Code Quality | N | N | N |
| Security | N | N | N |
| Performance | N | N | N |
| Testing | N | N | N |

Provide an overall assessment: APPROVE, REQUEST CHANGES, or NEEDS DISCUSSION.
