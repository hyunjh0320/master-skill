---
name: doc-gen
description: Generate documentation for code including JSDoc/docstrings, API docs, and usage examples. Use when the user wants to add or improve documentation.
disable-model-invocation: true
---

# Documentation Generation Skill

Generate clear, useful documentation that matches project conventions.

## Target

- `$ARGUMENTS` specifies files, functions, or modules to document
- If no arguments, document all uncommitted changes

## Workflow

### Step 1: Analyze Existing Docs
- Check existing documentation style in the project:
  - JSDoc, TSDoc, Google-style docstrings, NumPy-style, Rust doc comments, Go doc comments
- Match the existing format exactly
- If no existing docs, use the language's standard format

### Step 2: Analyze Code
- Read the target code
- Understand parameters, return types, side effects
- Identify usage patterns from callers

### Step 3: Generate Documentation

**For Functions/Methods:**
- Purpose (one line)
- Parameters with types and descriptions
- Return value with type and description
- Throws/errors with conditions
- Usage example (if non-obvious)

**For Classes/Modules:**
- Purpose and responsibility
- Key methods overview
- Usage example
- Relationship to other modules

**For API Endpoints:**
- HTTP method and path
- Request parameters/body with types
- Response format with types
- Error responses
- Example request/response

### Step 4: Generate Examples
- Create realistic, runnable examples
- Show common use cases
- Show error handling

## Rules
- Write for the READER, not the author
- Don't document the obvious (`getName` doesn't need "gets the name")
- Focus on WHY and HOW, not WHAT (the code already shows what)
- Keep examples practical and copy-pasteable
- Match the project's existing documentation language (English, etc.)
- Don't add docs to simple getters/setters or trivial code
