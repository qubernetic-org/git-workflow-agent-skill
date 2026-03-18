# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2026-03-18

### Changed

- Clarify back-merge PR (main → develop) does not require code review (#5)

## [1.0.0] - 2026-03-18

### Added

- Skill definition (`SKILL.md`) with complete Gitflow workflow specification
- Conventional Commits format with type reference table and examples
- Gitflow branch model: `main`, `develop`, `feature/*`, `fix/*`, `hotfix/*`, `release/*`
- Issue-driven workflow rules with full lifecycle documentation
- Semantic Versioning guide with bump rules and pre-release tags
- Standard and hotfix release process documentation
- Repository bootstrap section (one-time setup exception)
- Merge strategy section: `--no-ff` required, squash and rebase merge forbidden
- Feature branch sync guidance: rebase if not pushed, merge develop if shared
- Release issue requirement for consistent issue-driven workflow
- Decision guides: branch selection, commit type selection, version bump rules
- Forbidden operations list
- CHANGELOG format specification (Keep a Changelog)
- README with badges and Mermaid branch model diagram
- CLAUDE.md project guidance
- CONTRIBUTING.md contribution guidelines
- GitHub issue and PR templates
