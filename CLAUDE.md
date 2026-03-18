# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A Claude Code **skill** (SKILL.md) that enforces a strict Gitflow-based development workflow. It governs how commits are written, branches are created, PRs are opened, and releases are managed.

This is not a runnable application — it's a single `SKILL.md` file that instructs Claude Code to follow disciplined git practices.

## Workflow

This repo follows the same Gitflow workflow described in SKILL.md. Apply the skill's rules (conventional commits, issue-driven branching, PR-only merges, semantic versioning) when working here.

## Architecture

- **SKILL.md** — The entire skill definition. Self-contained installable artifact. Contains YAML frontmatter (`name`, `description`, `version`, `metadata`) followed by the complete workflow specification: branch model, commit format, issue-driven flow, semantic versioning, release process, and forbidden operations.
- **`.github/`** — PR template and issue templates (bug report, feature request).

## Key Invariants

When modifying SKILL.md, preserve these non-negotiable rules:

- **Atomic logical commits** — one commit = one change
- **Conventional Commits** format with imperative mood
- **No AI co-author signatures** in commits
- **Gitflow branch model** — `main`/`develop` protected, working branches typed
- **Issue-driven** — every branch traces back to a GitHub Issue
- **PR-only merges** to `main` and `develop`
- **Semantic Versioning** for all releases

## Editing the Skill

- SKILL.md must remain **self-contained** — it is the installable artifact
- The `description` field in frontmatter controls when Claude Code triggers the skill — keep trigger keywords updated if scope changes
- Keep version in sync between frontmatter `version`, `metadata.version`, and CHANGELOG.md

## Testing Changes

No automated tests. Manual verification:

1. Copy updated `SKILL.md` to `~/.claude/skills/git-workflow/SKILL.md`
2. Start a new Claude Code session
3. Ask Claude to perform git operations and verify it follows the workflow
