---
name: perf-check
description: Analyze code for performance issues including algorithmic complexity, memory usage, database queries, and rendering bottlenecks. Use when the user reports slow performance or wants optimization.
disable-model-invocation: true
---

# Performance Check Skill

Identify and resolve performance bottlenecks.

## Target

- `$ARGUMENTS` specifies files, functions, or areas to analyze
- If no arguments, analyze recent changes or reported slow areas

## Analysis Areas

### 1. Algorithmic Complexity
- Identify O(n^2) or worse nested loops
- Find unnecessary iterations over large datasets
- Check for redundant computations that could be cached
- Look for sort/search operations that could use better algorithms

### 2. Database & Queries
- N+1 query patterns (loop with individual queries)
- Missing indexes for frequently queried fields
- SELECT * when only specific columns needed
- Unbounded queries without LIMIT
- Missing connection pooling

### 3. Memory
- Large objects held in memory unnecessarily
- Unbounded caches or growing collections
- Memory leaks (event listeners not cleaned up, closures holding references)
- Large string concatenation in loops

### 4. I/O & Network
- Sequential operations that could be parallel
- Missing caching for expensive operations
- Unbatched API calls
- Large payload sizes

### 5. Frontend-Specific (if applicable)
- Unnecessary re-renders
- Large bundle size / missing code splitting
- Unoptimized images
- Layout thrashing (forced reflows)
- Missing virtualization for long lists

## Output Format

```
## Performance Analysis

### Critical (Immediate impact)
[P0] file:line - Issue description
  Impact: Quantified if possible (e.g., "O(n^2) with n=10000 items")
  Fix: Specific recommendation

### Important (Should fix)
[P1] file:line - Issue description
  Impact: ...
  Fix: ...

### Nice to have
[P2] file:line - Issue description

### Summary
| Area | Issues | Estimated Impact |
|------|--------|-----------------|
```

## Rules
- Quantify impact where possible (time complexity, query count, memory size)
- Only flag real performance issues, not micro-optimizations
- Consider the actual data size/scale before flagging
- Suggest specific fixes, not just "optimize this"
