---
name: test-gen
description: Generate tests for specified code. Analyzes existing test patterns in the project and creates consistent, comprehensive tests. Use when the user wants to add tests.
disable-model-invocation: true
---

# Test Generation Skill

Generate high-quality tests that match the project's testing conventions.

## Target

- `$ARGUMENTS` specifies files or functions to test
- If no arguments, generate tests for all uncommitted changes

## Workflow

### Step 1: Analyze Testing Setup
- Find existing test files to understand the testing framework and patterns:
  - Look for `jest.config.*`, `vitest.config.*`, `pytest.ini`, `pyproject.toml [tool.pytest]`, `.rspec`, `Cargo.toml [dev-dependencies]`, `go test` patterns
- Read 2-3 existing test files to learn:
  - Test file naming convention (`.test.ts`, `_test.go`, `test_*.py`, `*_spec.rb`)
  - Test directory structure (`__tests__/`, `tests/`, `spec/`, co-located)
  - Assertion style and test organization
  - Mocking/stubbing patterns
  - Setup/teardown patterns

### Step 2: Analyze Target Code
- Read the code to test
- Identify all public functions/methods
- Map input types, return types, side effects
- Identify edge cases and error conditions

### Step 3: Generate Tests
Create tests covering:

**Happy Path:**
- Normal expected inputs and outputs
- Typical use cases

**Edge Cases:**
- Empty inputs, null/undefined, zero values
- Boundary values (min, max, limits)
- Large inputs

**Error Cases:**
- Invalid inputs
- Missing required fields
- Network/IO failures (if applicable)

**Integration Points:**
- Mock external dependencies
- Verify correct interactions with dependencies

### Step 4: Verify
- Run the generated tests to make sure they pass
- Fix any failing tests

## Rules
- ALWAYS match the project's existing test patterns exactly
- Use the same assertion library, mocking approach, and structure
- Test behavior, not implementation details
- Each test should test ONE thing
- Test names should describe the expected behavior
- Don't test private/internal functions directly
- Keep tests independent (no shared state between tests)
