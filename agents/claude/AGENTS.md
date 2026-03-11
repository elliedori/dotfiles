# Agent Guidelines

## Style

- Keep it simple.
- No inline `if` statements. Always use braces.
- Non-null assertions (`!`) are never allowed, even in tests.
- Type imports must use their own `import type` declaration, never `import { type X }`.

## Commits

- Don't commit secrets, tokens, env files, or credentials.
- Write short commit messages focused on _why_, not _what_.

## Changes

- Prefer editing existing files over creating new ones.
- Don't add comments that just narrate what the code does.
- Scripts should be idempotent — safe to re-run.