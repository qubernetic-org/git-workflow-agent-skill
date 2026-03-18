# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Merge strategy section: `--no-ff` required, squash and rebase merge forbidden on protected branches
- Feature branch sync guidance: rebase if not pushed, merge develop if already shared
- Release issues requirement: every release branch gets a lightweight tracking issue

### Changed

- PR title convention: Conventional Commits format instead of branch name
- Branch deletion clarified: both remote and local, with GitHub auto-delete recommendation
- Release and hotfix processes: added `--no-ff` at each merge step, added issue creation step
- Branch naming clarified: issue prefix for working branches, version-only for release branches
- Removed duplicate `metadata.version` from frontmatter (single source of truth)

## [1.0.0] - 2026-03-18

### Added

- Initial skill definition (`SKILL.md`) with complete Gitflow workflow specification
- Conventional Commits format with type reference table and examples
- Gitflow branch model: `main`, `develop`, `feature/*`, `fix/*`, `hotfix/*`, `release/*`
- Issue-driven workflow rules with full lifecycle documentation
- Semantic Versioning guide with bump rules and pre-release tags
- Standard and hotfix release process documentation
- CHANGELOG format specification (Keep a Changelog)
- Decision guides: branch selection, commit type selection, version bump rules
- Forbidden operations list
