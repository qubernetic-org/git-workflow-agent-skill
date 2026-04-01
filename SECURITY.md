# Security Policy

## Scope

This repository contains a Claude Code skill definition (SKILL.md) that governs git workflow behavior. While it is not a running application, security issues can still arise if the skill:

- Encourages or permits force-pushing to protected branches
- Bypasses code review requirements or PR-based merge gates
- Leads to accidental exposure of secrets, credentials, or tokens in commits
- Skips commit signing or verification steps in contexts where they are required
- Instructs an AI agent to execute destructive git operations without safeguards

If you discover that the skill's instructions could cause any of the above, or any other unintended security-relevant behavior, please report it.

## Reporting a Vulnerability

**Do not open a public GitHub issue for security vulnerabilities.**

Instead, use one of the following:

- **GitHub Security Advisories**: Report privately via [GitHub's Security Advisory feature](https://github.com/qubernetic/git-workflow-agent-skill/security/advisories/new) on this repository.
- **Email**: Send a detailed report to **security@qubernetic.org**.

Please include:

- A description of the issue and its potential impact
- Steps to reproduce or a scenario demonstrating the problem
- The version of SKILL.md affected (see frontmatter `version` field)

## Response Timeline

- **Acknowledgment**: Within 3 business days of receiving your report
- **Initial assessment**: Within 7 business days
- **Resolution or mitigation**: Targeted within 30 days, depending on severity

We will keep you informed of progress and credit reporters in the fix unless anonymity is requested.

## Supported Versions

Only the latest released version of SKILL.md receives security updates. Check the `version` field in the SKILL.md frontmatter for the current version.
