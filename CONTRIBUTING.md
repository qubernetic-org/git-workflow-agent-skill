# Contributing

Thank you for your interest in improving the git workflow skill.

## Prerequisites

- **Git** (2.20+)
- **Bash** — required for `scripts/lint.sh` (see [Running the Linter](#running-the-linter) for platform-specific instructions)
- **Claude Code** — for manual testing of skill behavior
- **GitHub CLI (`gh`)** — optional but recommended for issue/PR management

## Development Workflow

This repo follows its own Gitflow workflow. Every contribution goes through these steps:

```
1. Open a GitHub Issue describing the change
2. Fork the repo (external contributors) or create a branch directly (maintainers)
3. Create a branch from develop:
   git checkout develop
   git pull origin develop
   git checkout -b <type>/<issue>-<slug>
4. Make atomic commits using Conventional Commits format
5. Run the linter:
   ./scripts/lint.sh
6. Push and open a PR targeting develop:
   git push -u origin <type>/<issue>-<slug>
   gh pr create --base develop
7. Verify test plan items and check them off in the PR description
8. After merge, clean up:
   git checkout develop && git pull origin develop
   git fetch --prune && git branch -d <type>/<issue>-<slug>
```

### Branch Types

| Change type | Branch prefix | Example |
|-------------|---------------|---------|
| New feature | `feature/` | `feature/42-add-search` |
| Bug fix | `fix/` | `fix/17-broken-navbar` |
| Documentation | `docs/` | `docs/23-update-readme` |

### Commit Format

```
<type>(<optional scope>): <description>
```

Use imperative mood, lowercase after colon, no period. See SKILL.md for the full type reference.

## Running the Linter

The linter (`scripts/lint.sh`) validates SKILL.md structure and version consistency. It requires bash.

### macOS / Linux

```bash
./scripts/lint.sh
```

### Windows — Git Bash

Git for Windows includes Git Bash, which can run the linter natively:

```bash
# Open Git Bash (installed with Git for Windows)
./scripts/lint.sh
```

### Windows — WSL

```bash
# From a WSL terminal
./scripts/lint.sh
```

### Windows — PowerShell (via Git Bash)

If you prefer to stay in PowerShell, invoke Git Bash explicitly:

```powershell
& "C:\Program Files\Git\bin\bash.exe" -c "./scripts/lint.sh"
```

> **Note:** The linter has zero external dependencies — it only needs bash, grep, awk, and sed, all of which are included in Git Bash and WSL.

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

Before submitting a PR:

1. Run the linter: `./scripts/lint.sh`
2. Copy the updated `SKILL.md` to `~/.claude/skills/git-workflow/SKILL.md`
3. Start a new Claude Code session
4. Ask Claude to perform git operations and verify it follows the workflow

## Reporting Bugs

If the skill produces incorrect git behavior (e.g., wrong branch base, missing issue reference, incorrect commit type), please open an issue with:

- The prompt you used
- What Claude did wrong
- What the correct behavior should have been
