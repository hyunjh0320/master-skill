---
name: explain
description: Explain code, architecture, or concepts with clear descriptions, diagrams, and examples. Use when the user wants to understand how code works or needs an explanation.
disable-model-invocation: true
---

# Explain Code Skill

Provide clear, educational explanations of code and architecture.

## Target

- `$ARGUMENTS` specifies a file, function, module, or concept to explain
- If a file path is given, read and explain it
- If a concept is given, find relevant code and explain it

## Explanation Approach

### Step 1: Overview
- What is this code's purpose? (1-2 sentences)
- Where does it fit in the overall system?

### Step 2: Architecture
- Show the high-level structure using ASCII diagrams where helpful:

```
[Component A] --> [Component B] --> [Component C]
       |                                  |
       v                                  v
  [Database]                         [External API]
```

### Step 3: Detailed Walkthrough
- Walk through the code step-by-step
- Explain WHY decisions were made, not just WHAT the code does
- Highlight key patterns used (e.g., Observer, Factory, Middleware)

### Step 4: Data Flow
- Trace how data moves through the code
- Show input → transformation → output

### Step 5: Key Concepts
- Explain any domain-specific or complex concepts
- Use analogies to everyday things when helpful
- Call out non-obvious behavior or gotchas

## Output Format

```
## [Component/Function Name]

**Purpose:** One-line summary

**Architecture:**
[ASCII diagram if helpful]

**How it works:**
1. Step-by-step walkthrough

**Key concepts:**
- Concept explanations

**Gotchas:**
- Non-obvious behaviors to watch for

**Related files:**
- file_path:line - description
```

## Rules
- Match explanation depth to the complexity of the code
- Use the project's own terminology
- Don't over-explain simple things
- Include file:line references so the user can navigate
