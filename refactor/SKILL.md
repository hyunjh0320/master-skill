---
name: refactor
description: Refactor code to improve structure, readability, and maintainability without changing behavior. Use when the user wants to clean up, restructure, or modernize code.
disable-model-invocation: true
---

# Refactor Skill

Improve code structure while preserving behavior.

## Target

- `$ARGUMENTS` specifies files, functions, or modules to refactor
- If no arguments, ask the user what to refactor

## Refactoring Workflow

### Step 1: Analyze Current Code
- Read the target code thoroughly
- Identify existing tests that cover this code
- Map dependencies (what calls this code, what this code calls)
- Understand the current behavior completely

### Step 2: Identify Issues
Look for these code smells:
- **Long functions** (>30 lines) - break into smaller functions
- **Deep nesting** (>3 levels) - use early returns or extract
- **Duplicate code** - extract shared logic
- **God objects** - split responsibilities
- **Feature envy** - move logic to the right class/module
- **Primitive obsession** - introduce domain types
- **Long parameter lists** - use objects/structs
- **Dead code** - remove unused code safely

### Step 3: Plan Changes
- List specific refactoring steps
- Ensure each step preserves behavior
- Order steps to minimize risk

### Step 4: Execute
- Apply refactoring changes
- Keep each change small and focused
- Maintain existing formatting conventions of the project

### Step 5: Validate
- Ensure tests still pass
- Check that public API hasn't changed (unless intended)
- Verify no new dependencies introduced unnecessarily

## Rules
- NEVER change behavior during refactoring
- NEVER add features during refactoring
- Keep the project's existing code style and conventions
- If no tests exist, warn the user about risk before proceeding
- Prefer standard language patterns over clever abstractions
