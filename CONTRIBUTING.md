# Contributing

Thank you for your interest in improving the git workflow skill.

## How to Contribute

1. **Open an issue first** — describe what you want to change and why.
2. **Fork the repo** and create a feature branch from `main`.
3. **Make your changes** following the guidelines below.
4. **Open a pull request** against `main`.

## Guidelines

### Invariants (non-negotiable)

Every change must preserve these rules in the skill:

- **Atomic logical commits** — one commit = one change
- **Conventional Commits** format with imperative mood
- **No AI co-author signatures** in commits
- **Gitflow branch model** — `main`/`develop` protected
- **Issue-driven workflow** — every branch traces to a GitHub Issue
- **PR-only merges** to protected branches
- **Semantic Versioning** for releases

### Content Rules

- SKILL.md must remain self-contained — it is the installable artifact
- All content must be in **English**
- Decision guides and examples should cover real-world edge cases

### Testing

Before submitting a PR, test your changes by:

1. Copying the updated `SKILL.md` to `~/.claude/skills/git-workflow/SKILL.md`
2. Starting a new Claude Code session
3. Asking Claude to perform git operations and verifying it follows the workflow

## Reporting Bugs

If the skill produces incorrect git behavior (e.g., wrong branch base, missing issue reference, incorrect commit type), please open an issue with:

- The prompt you used
- What Claude did wrong
- What the correct behavior should have been
