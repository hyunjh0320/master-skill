---
name: git-workflow
description: Manage git operations including branching, committing, PR creation, and conflict resolution. Use when the user needs help with git operations or workflow.
disable-model-invocation: true
---

# Git Workflow Skill

Streamlined git operations following best practices.

## Commands

`$ARGUMENTS` determines the action:

### `branch <name>` - Create feature branch
```bash
git checkout -b <branch-name>
```
- Use conventional naming: `feature/`, `fix/`, `refactor/`, `docs/`

### `commit` - Smart commit
1. Run `git status` and `git diff --cached` to analyze staged changes
2. If nothing staged, run `git diff` and suggest what to stage
3. Generate a conventional commit message:
   - `feat:` new feature
   - `fix:` bug fix
   - `refactor:` code restructuring
   - `docs:` documentation
   - `test:` adding/updating tests
   - `chore:` maintenance tasks
4. Create the commit

### `pr` - Create Pull Request
1. Analyze all commits on the current branch vs base
2. Generate PR title (< 70 chars) and body with:
   - Summary of changes (bullet points)
   - Test plan
3. Push and create PR via `gh pr create`

### `sync` - Sync with main branch
1. Fetch latest from origin
2. Rebase current branch on main/master
3. Resolve conflicts if any

### `log` - Show meaningful history
- Show recent commits with context

## Commit Message Rules
- First line: type + concise summary (< 72 chars)
- Body: WHY the change was made (if not obvious)
- Reference issue numbers when applicable
- Use imperative mood ("Add feature" not "Added feature")

## Important
- NEVER force push to main/master
- NEVER skip pre-commit hooks
- Always create NEW commits rather than amending unless explicitly asked
- Prefer specific `git add <file>` over `git add .`
