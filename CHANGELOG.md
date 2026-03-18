# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.2] - 2026-03-18

### Fixed

- Correct back-merge direction in branch model diagram: now flows from main → develop (#10)

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

[1.0.2]: https://github.com/qubernetic-org/git-workflow-agent-skill/compare/v1.0.1...v1.0.2
[1.0.1]: https://github.com/qubernetic-org/git-workflow-agent-skill/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/qubernetic-org/git-workflow-agent-skill/releases/tag/v1.0.0
