# Verified Skills Reference (English — for Claude)

> Last updated: 2026-03-03
> Sources: [SkillsMP](https://skillsmp.com), [GitHub](https://github.com/anthropics/skills), [awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills)

## Purpose

This document is the **authoritative reference** that Claude MUST check before every task.
When a task matches a skill's trigger condition, Claude MUST recommend it to the user.

---

## Trust Tiers

| Tier | Source | Trust Level |
|------|--------|-------------|
| S (Official) | [anthropics/skills](https://github.com/anthropics/skills) | Anthropic official — always safe |
| S (Official) | Claude Code built-in (`/simplify`, `/batch`) | Bundled — always available |
| A (Enterprise) | [getsentry/skills](https://github.com/getsentry/skills) | Sentry team — production-tested |
| A (Enterprise) | [trailofbits/skills](https://github.com/trailofbits/skills) | Trail of Bits — security experts |
| B (Community) | [obra/superpowers](https://github.com/obra/superpowers) | 20+ battle-tested skills framework |
| C (Marketplace) | [SkillsMP](https://skillsmp.com) | 283k+ skills — must verify before use |

---

## Skill-to-Task Mapping

### SECURITY

| Skill | Source | Tier | Trigger Condition |
|-------|--------|------|-------------------|
| `security-review` | getsentry/skills | A | Any security audit, OWASP review, vulnerability check |
| `differential-review` | trailofbits/skills | A | Reviewing code diffs for security regressions |
| `fix-review` | trailofbits/skills | A | Verifying bug-fix commits don't introduce regressions |
| `agentic-actions-auditor` | trailofbits/skills | A | Auditing GitHub Actions with AI agents |
| `fail-open-detector` | trailofbits/skills | A | Checking for insecure defaults, weak secrets |
| `/security-review` | Claude Code built-in | S | Quick security scan of pending changes |

### CODE REVIEW

| Skill | Source | Tier | Trigger Condition |
|-------|--------|------|-------------------|
| `code-review` | getsentry/skills | A | PR review, code quality check |
| `requesting-code-review` | obra/superpowers | B | Auto-activates between tasks, severity-based reporting |
| `/simplify` | Claude Code built-in | S | After feature/bugfix — parallel review (reuse, quality, efficiency) |

### TESTING

| Skill | Source | Tier | Trigger Condition |
|-------|--------|------|-------------------|
| TDD skills | obra/superpowers | B | Writing tests, RED/GREEN TDD workflow |
| `property-based-testing` | trailofbits/skills | A | Serialization, parsing, validation testing |
| `fuzzing-harness` | trailofbits/skills | A | Writing fuzz tests for C/C++ |

### DEBUGGING

| Skill | Source | Tier | Trigger Condition |
|-------|--------|------|-------------------|
| `systematic-debugging` | obra/superpowers | B | Any bug investigation — 4-phase root cause analysis |
| `find-bugs` | getsentry/skills | A | Scanning branch changes for bugs and vulnerabilities |

### GIT WORKFLOW

| Skill | Source | Tier | Trigger Condition |
|-------|--------|------|-------------------|
| `commit` | getsentry/skills | A | Writing commit messages |
| `create-pr` | getsentry/skills | A | Creating pull requests |
| `finishing-a-development-branch` | obra/superpowers | B | Task complete → verify tests → merge/PR/keep/discard |

### PLANNING & DESIGN

| Skill | Source | Tier | Trigger Condition |
|-------|--------|------|-------------------|
| `brainstorming` | obra/superpowers | B | Before coding — refine ideas, explore alternatives |
| `write-plan` | obra/superpowers | B | Creating implementation plans |
| `execute-plan` | obra/superpowers | B | Executing plans via subagent batches |

### DOCUMENTATION

| Skill | Source | Tier | Trigger Condition |
|-------|--------|------|-------------------|
| `docx` | anthropics/skills | S | Word document creation/editing |
| `pdf` | anthropics/skills | S | PDF manipulation |
| `pptx` | anthropics/skills | S | PowerPoint creation/editing |
| `xlsx` | anthropics/skills | S | Excel spreadsheet processing |

### AUDIT & COMPLIANCE

| Skill | Source | Tier | Trigger Condition |
|-------|--------|------|-------------------|
| `audit-context-building` | trailofbits/skills | A | Deep code audit — line-by-line analysis |
| `security-compliance` | SkillsMP (davila7) | C | Asset discovery → vuln scan → CVSS prioritization |

---

## Decision Rules for Claude

### MUST recommend when:
1. Task clearly matches a Tier S or A skill trigger condition
2. User is doing security-sensitive work → recommend `security-review`
3. User completes code changes → recommend `/simplify` or `code-review`
4. User asks to fix a bug → recommend `systematic-debugging` or `find-bugs`
5. User asks for tests → recommend TDD skills
6. User starts new project → recommend `brainstorming` + exploration

### SHOULD recommend when:
1. Task matches a Tier B skill trigger condition
2. Multiple skills apply → recommend the combination (e.g., debug → fix → test-gen → code-review)

### SHOULD NOT recommend when:
1. Task is trivial (single-line edit, simple question)
2. User has already explicitly declined a skill for this task
3. Tier C skills unless no better alternative exists

### Recommendation format:
```
이 작업에 `/<skill-name>` 스킬을 사용하면 좋겠습니다. (<reason>)
```

### After user does not object:
Execute the skill via the Skill tool or guide installation if not yet installed.

---

## Installation Commands

```bash
# Sentry skills
npx skills add getsentry/skills@security-review
npx skills add getsentry/skills@code-review
npx skills add getsentry/skills@find-bugs

# Trail of Bits
/plugin marketplace add trailofbits/skills

# Superpowers
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace

# Manual install
git clone <repo> /tmp/skill-repo
cp -r /tmp/skill-repo/plugins/<skill-name> ~/.claude/skills/
```

---

## Verification Checklist (before installing any new skill)

- [ ] GitHub stars >= 2 (SkillsMP minimum)
- [ ] Updated within last 6 months
- [ ] `allowed-tools` is minimal
- [ ] Clear trigger conditions in SKILL.md
- [ ] No malicious code or prompt injection patterns
- [ ] Maintained by trusted org/individual
