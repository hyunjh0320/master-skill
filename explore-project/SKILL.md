---
name: explore-project
description: Explore and map out a project's structure, architecture, tech stack, and conventions. Use when starting work on an unfamiliar codebase or when the user asks about project structure.
disable-model-invocation: true
---

# Explore Project Skill

Quickly understand a project's architecture and conventions.

## Workflow

### Step 1: Project Identity
- Read `package.json`, `Cargo.toml`, `pyproject.toml`, `go.mod`, `Gemfile`, `pom.xml`, or equivalent
- Identify: language, framework, version, key dependencies
- Read `README.md` for project description

### Step 2: Directory Structure
- Map the top-level directory structure
- Identify patterns: monorepo, MVC, feature-based, layered architecture
- Note key directories and their purposes

### Step 3: Entry Points
- Find main entry files (`main.ts`, `index.js`, `main.go`, `app.py`, etc.)
- Trace the application bootstrap flow
- Identify routing/endpoint definitions

### Step 4: Configuration
- Development setup: `.env.example`, docker-compose, Makefile
- CI/CD: `.github/workflows/`, `.gitlab-ci.yml`, `Jenkinsfile`
- Linting/formatting: `.eslintrc`, `.prettierrc`, `ruff.toml`, `.editorconfig`
- Build: `webpack.config`, `vite.config`, `tsconfig.json`

### Step 5: Conventions
- Code style (naming, file organization)
- Testing patterns (framework, file placement, naming)
- API patterns (REST, GraphQL, RPC)
- State management approach
- Error handling patterns

### Step 6: Key Modules
- List the most important modules/packages
- Brief description of each module's responsibility
- Note dependency relationships between modules

## Output Format

```
## Project: <name>

**Stack:** Language, Framework, Key Libraries
**Architecture:** Pattern (e.g., Monorepo, Microservice, Monolith)
**Build:** Tool + Command
**Test:** Tool + Command
**Lint:** Tool + Command

### Directory Map
<tree structure with descriptions>

### Key Modules
| Module | Purpose | Key Files |
|--------|---------|-----------|

### Conventions
- Naming: ...
- Testing: ...
- API: ...

### Getting Started
<commands to install, build, test, run>
```
