# Onboarding

Welcome! This guide helps new contributors understand the project, its structure, and how to work on it effectively.

## What This Project Is

This is a **Claude Code skill** — a single Markdown file (`SKILL.md`) that instructs Claude Code to follow a strict Gitflow-based development workflow. It is not a runnable application, library, or service.

When installed, Claude Code reads SKILL.md and enforces its rules during git operations: creating branches, writing commits, opening PRs, managing releases, and more.

## Key Files

| File | Purpose |
|------|---------|
| `SKILL.md` | **The skill itself.** Self-contained installable artifact with YAML frontmatter and the complete workflow specification. This is what users install. |
| `README.md` | Public-facing documentation with installation instructions and feature overview. |
| `CHANGELOG.md` | Release history following [Keep a Changelog](https://keepachangelog.com/) format. |
| `CONTRIBUTING.md` | Contribution rules and invariants. |
| `CLAUDE.md` | Guidance for Claude Code when working on this repo. |
| `SECURITY.md` | Vulnerability reporting policy. |
| `CODE_OF_CONDUCT.md` | Community standards (Contributor Covenant v2.1). |
| `scripts/lint.sh` | Automated linter that validates SKILL.md structure and version consistency. |
| `.github/` | PR template, issue templates, and GitHub Actions workflows. |

## How to Install and Test Locally

```bash
# 1. Copy the skill to Claude Code's skill directory
mkdir -p ~/.claude/skills/git-workflow
cp SKILL.md ~/.claude/skills/git-workflow/SKILL.md

# 2. Start a new Claude Code session
claude

# 3. Test by asking Claude to perform git operations:
#    - "Create a branch for issue #42"
#    - "Commit this change"
#    - "Open a PR"
#    Verify Claude follows the workflow rules.
```

## How the Skill Works

1. **Frontmatter** — The YAML block at the top of SKILL.md contains `name`, `description`, and `version`. The `description` field controls when Claude Code activates the skill (keyword matching).
2. **Rules** — The body defines branch naming, commit format, merge strategy, release process, and forbidden operations.
3. **Activation** — When a user mentions git-related terms (commit, branch, merge, release, etc.), Claude Code loads the skill and follows its rules.

## Lifecycle of a Change

```
1. Open a GitHub Issue describing the change
2. Create a branch from develop: fix/<issue>-<slug> or feature/<issue>-<slug>
3. Make atomic commits using Conventional Commits format
4. Run the linter: ./scripts/lint.sh
5. Push and open a PR targeting develop
6. Test plan items are verified and checked off in the PR description
7. PR is merged with --no-ff
8. Issue is closed (auto-closed by workflow or manually)
9. Branch is deleted (remote + local)
```

For releases, the flow is: `develop` → `release/<version>` → `main` (tag + GitHub Release) → back-merge to `develop`.

## Version Sync

Three places must always agree on the version number:

1. `SKILL.md` frontmatter `version` field
2. `SKILL.md` `metadata.version` field
3. `README.md` version badge
4. `CHANGELOG.md` latest entry

Run `./scripts/lint.sh` to verify consistency.

## Common Pitfalls

- **Editing SKILL.md is editing the product** — every change affects how Claude Code behaves for all users of this skill.
- **SKILL.md must stay self-contained** — don't reference external files from within it. It's copied as a single file.
- **Version bumps happen on release branches only** — don't bump versions in feature/fix branches.
- **Always pull before branching** — `git pull origin develop` before `git checkout -b` to avoid stale forks.
- **No AI co-author signatures** — never add `Co-Authored-By` lines to commits in this repo.
