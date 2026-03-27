# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.4.0] - 2026-03-28

### Added

- GitHub Actions workflow to run lint on every PR (#79)
- Lint status badge in README (#92)
- Workflow comparison section in README: Gitflow vs GitHub Flow vs Trunk-Based (#80)
- Integration guide with commitlint, husky, and branch name CI validation (#91)
- 5 additional troubleshooting scenarios: wrong base branch, merge conflicts, deleted branch, committed secrets, wrong merge target (#81)
- ONBOARDING.md worked example and FAQ section (#82)
- ONBOARDING.md link in README navigation bar (#87)

### Changed

- Upgrade GitHub Actions to Node.js 24: checkout v4→v5, github-script v7→v8 (#80)
- Update CLAUDE.md Architecture section to include scripts/ and workflows (#89)
- Update CLAUDE.md Testing section with lint and install script references (#89)

## [1.3.0] - 2026-03-27

### Added

- Install script for Linux — `scripts/install_linux.sh` (#68)
- Install script for macOS — `scripts/install_macos.sh` (#69)
- Install script for Windows — `scripts/install_windows.ps1` (#70)

### Changed

- Rename `install.sh` to `install_linux.sh` for consistent cross-platform naming (#69)
- Update README installation section with platform-specific scripts and uninstall instructions (#74)
- Improve CONTRIBUTING.md with development workflow and cross-platform lint guide (#63)

## [1.2.0] - 2026-03-27

### Added

- Automated linting script for SKILL.md structure validation (#57)
- Troubleshooting section with recovery steps for 5 common workflow mistakes (#58)
- ONBOARDING.md for new contributors (#59)

### Changed

- Improve CONTRIBUTING.md with development workflow and cross-platform lint guide (#63)

### Fixed

- Lint script: skip code block contents in heading hierarchy check (#58)

## [1.1.0] - 2026-03-27

### Added

- GitHub Actions workflow to auto-close issues on non-default branch merges (#44)
- Auto-close workflow reference and guidance in SKILL.md (#44)
- Test plan checklist verification step to Issue-Driven Workflow (#52)
- Pre-release Tags section with alpha/beta/rc guidance and SemVer precedence (#40)
- SECURITY.md for vulnerability reporting (#42)
- CODE_OF_CONDUCT.md using Contributor Covenant v2.1 (#43)

### Fixed

- Enforce `git pull` before creating new branches to prevent stale forks (#35)
- Add missing commit types (`style`, `ci`, `build`, `revert`) to Decision Guide (#38)
- Add `bash` language tags to fenced code blocks for syntax highlighting (#39)
- Update README.md version badge from 1.0.2 to 1.0.4 (#37)

## [1.0.4] - 2026-03-18

### Changed

- Add GitHub Release template and creation step to release process (#30)

## [1.0.3] - 2026-03-18

### Fixed

- Add missing metadata.version field to SKILL.md frontmatter (#15)

### Changed

- Clarify GitHub merge strategy for --no-ff requirement (#17)
- Clarify semver impact for revert commit type (#18)
- Document GitHub auto-close limitation with non-default branch merges (#23)
- Emphasize workflow discipline independent of branch protection (#25)
- Add comparison links to CHANGELOG.md (#16)

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

[1.4.0]: https://github.com/qubernetic-org/git-workflow-agent-skill/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/qubernetic-org/git-workflow-agent-skill/compare/v1.2.0...v1.3.0
[1.2.0]: https://github.com/qubernetic-org/git-workflow-agent-skill/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/qubernetic-org/git-workflow-agent-skill/compare/v1.0.4...v1.1.0
[1.0.4]: https://github.com/qubernetic-org/git-workflow-agent-skill/compare/v1.0.3...v1.0.4
[1.0.3]: https://github.com/qubernetic-org/git-workflow-agent-skill/compare/v1.0.2...v1.0.3
[1.0.2]: https://github.com/qubernetic-org/git-workflow-agent-skill/compare/v1.0.1...v1.0.2
[1.0.1]: https://github.com/qubernetic-org/git-workflow-agent-skill/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/qubernetic-org/git-workflow-agent-skill/releases/tag/v1.0.0
