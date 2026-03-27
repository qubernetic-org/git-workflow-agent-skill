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
# 1. Install using the platform-specific script (creates a symlink)
./scripts/install_linux.sh     # Linux
./scripts/install_macos.sh     # macOS
.\scripts\install_windows.ps1  # Windows (PowerShell)

# 2. Start a new Claude Code session
claude

# 3. Test by asking Claude to perform git operations:
#    - "Create a branch for issue #42"
#    - "Commit this change"
#    - "Open a PR"
#    Verify Claude follows the workflow rules.
```

> **Tip:** The install script creates a symlink, so the skill auto-syncs when you pull new changes. No need to re-copy after updates.

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

## Worked Example: Contributing a Bug Fix

Here's a complete walkthrough of fixing a typo in SKILL.md:

```bash
# 1. Open an issue on GitHub: "fix: typo in Troubleshooting section"
#    Note the issue number (e.g., #99)

# 2. Create your branch
git checkout develop
git pull origin develop
git checkout -b fix/99-troubleshooting-typo

# 3. Make the fix in SKILL.md, then commit
git add SKILL.md
git commit -m "fix: correct typo in Troubleshooting section"

# 4. Run the linter
./scripts/lint.sh

# 5. Push and open a PR
git push -u origin fix/99-troubleshooting-typo
gh pr create --base develop \
  --title "fix: correct typo in Troubleshooting section (#99)" \
  --body "Closes #99"

# 6. After review and merge, clean up
git checkout develop
git pull origin develop
git fetch --prune
git branch -d fix/99-troubleshooting-typo
```

## FAQ

**Can I use this skill with other AI assistants?**
The skill is written for Claude Code specifically. The YAML frontmatter and activation keywords are Claude Code conventions. Other assistants would need their own format, but the workflow rules themselves are universal.

**What if my project doesn't use Gitflow?**
This skill enforces Gitflow. If your project uses GitHub Flow or trunk-based development, this skill isn't the right fit. See the [README comparison table](README.md#why-this-workflow) for guidance on when Gitflow makes sense.

**Do I need all the files or just SKILL.md?**
Users only need `SKILL.md` — it's the complete, self-contained skill. All other files (README, CONTRIBUTING, etc.) are for contributors to this repo.

**How do I test if my SKILL.md change works?**
Install the updated skill, start a fresh Claude Code session, and ask Claude to perform the git operation your change affects. There are no automated tests — verification is manual.

**Why are there no automated tests?**
The skill is a natural-language specification interpreted by an LLM. Traditional unit tests can't verify that Claude follows the rules correctly. The lint script validates structure, but behavioral testing requires a live Claude Code session.
