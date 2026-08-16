# Changelog

## Unreleased

### Added

- Initial public kernel: the safety baseline loaded into every agent session —
  secrets, version control, cross-repository authoring, destructive file
  operations, and shared working trees.
- `scripts/leak-guard.sh` and a blocking CI job, refusing operator-specific
  content on every push and pull request.

Extracted from a private doctrine repository. History starts here deliberately:
the original carries operator-specific content across its full history, and
rewriting that was judged less safe than beginning clean.
