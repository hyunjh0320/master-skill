---
name: security-review
description: Perform a security-focused code review checking for OWASP Top 10 vulnerabilities, authentication/authorization issues, and data exposure risks. Use when the user wants a security audit or security check.
disable-model-invocation: true
---

# Security Review Skill

Comprehensive security analysis of code.

## Target

- `$ARGUMENTS` specifies files or directories to review
- If no arguments, review all uncommitted changes
- Focus especially on: API endpoints, auth logic, data handling, user input processing

## Security Checklist

### 1. Injection (OWASP A03)
- SQL injection (raw queries, string concatenation)
- Command injection (shell exec, eval)
- XSS (unescaped user input in HTML/templates)
- LDAP injection, XML injection, path traversal

### 2. Authentication & Authorization (OWASP A01, A07)
- Broken access control (missing auth checks)
- Privilege escalation paths
- Insecure session management
- Hardcoded credentials or API keys
- Weak password policies

### 3. Sensitive Data (OWASP A02)
- Secrets in code (API keys, passwords, tokens)
- Sensitive data in logs or error messages
- Missing encryption for data at rest/transit
- PII exposure in responses

### 4. Configuration (OWASP A05)
- Debug mode in production
- Default credentials
- Overly permissive CORS
- Missing security headers
- Insecure deserialization

### 5. Dependencies
- Known vulnerable packages (check versions)
- Outdated dependencies with CVEs
- Unnecessary dependencies increasing attack surface

## Output Format

```
## Security Review Report

### Critical Findings
[CRITICAL] file:line - Description
  Impact: What could be exploited
  Fix: How to remediate

### High Findings
[HIGH] file:line - Description
  Impact: ...
  Fix: ...

### Medium Findings
[MEDIUM] file:line - Description

### Low Findings
[LOW] file:line - Description

### Summary
- Critical: N
- High: N
- Medium: N
- Low: N
- Overall Risk: HIGH/MEDIUM/LOW
```

## Important
- Flag ANY hardcoded secret immediately, even in test files
- Check .env files are in .gitignore
- Verify rate limiting on authentication endpoints
- Check for SSRF in URL handling code
