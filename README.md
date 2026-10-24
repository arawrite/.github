# .github

The AraWrite organization's public profile, in [`profile/README.md`](profile/README.md), and the shared CI workflows.

## Shared CI workflows

Reusable workflows that the AraWrite repositories call on every pull request. Each one runs all its checks even after one fails, so a single run reports every problem.

| Workflow | Checks | Inputs |
|---|---|---|
| `python.yml`, Python checks | Install with uv, Ruff format and lint, pyright, import-linter, pytest under coverage.py, coverage gate | `working-directory`, default `.` |
| `typescript.yml`, TypeScript checks | Install with npm, Prettier, ESLint, `tsc --build`, Vitest, coverage gate | `working-directory`, default `.` |
| `flutter.yml`, Flutter checks | Install with pub, `dart format`, `flutter analyze`, `flutter test` in every workspace package, coverage gate | `working-directory`, default `.` |
| `dart-mutation.yml`, Dart mutation testing | `mutation_test` in each named package | `working-directory`, default `.`; `paths`, required |

- **Coverage:** at least 85% of lines and 85% of branches, written to the run summary. Flutter's tests import every library of each package, so a file no test loads counts as uncovered, and skipped Dart tests run anyway.
- **Mutation testing:** at least 80% of mutants detected, the tool's default, in the packages a repository names; only the grader and progress-rule packages get it.
- **Warnings fail:** pyright `--warnings`, ESLint `--max-warnings 0` and `flutter analyze --fatal-infos`.
- **Versions** come from the calling repository: its lockfile for tools, `.python-version` and uv's `required-version`, the `devEngines` of `package.json`, and the exact Flutter version under `environment` in `pubspec.yaml`.

### Calling them

```yaml
name: Checks
on: pull_request
permissions:
  contents: read
jobs:
  flutter:
    uses: arawrite/.github/.github/workflows/flutter.yml@main
```

Mutation testing runs in its own caller, limited to the packages it mutates:

```yaml
name: Mutation testing
on:
  pull_request:
    paths:
      - packages/grader/**
      - packages/progress/**
permissions:
  contents: read
jobs:
  mutation:
    uses: arawrite/.github/.github/workflows/dart-mutation.yml@main
    with:
      paths: packages/grader packages/progress
```

### Tool configuration

Each repository configures its rules in its own tool files, so local runs and CI agree. The passing fixtures, under `tests/fixtures/<language>/good`, are the reference configuration:

- strict types: pyright strict, the TypeScript strict flags, and Dart's strict casts, inference and raw types;
- boundaries: import-linter contracts, eslint-plugin-boundaries policies, and pub workspace packages;
- markers: Ruff's `FIX` rules, ESLint's `no-warning-comments`, and the analyzer's `todo`, `fixme` and `hack`;
- skipped and focused tests: Ruff's banned `pytest` skip and `xfail` APIs, and the Vitest plugin's `no-disabled-tests`, `no-focused-tests` and `warn-todo`; Dart's `solo` is reported by the analyzer;
- suppressions: Ruff's `PGH003`, `PGH004` and `RUF100`, pyright's unnecessary ignores, ESLint comment descriptions and unused directives, the description that `@ts-expect-error` needs, and Dart's `unnecessary_ignore`.

### Actions minutes

Private repositories on GitHub Free get 2,000 Linux minutes a month, billed to the calling repository. The workflows run on Linux only, in one job per language, cancel superseded runs, cache toolchains and dependencies, and stop at a time limit. Callers run them on pull requests only, and mutation testing only when the mutated packages change.

## Self-test

`self-test.yml` runs every workflow on the fixtures under `tests/fixtures` and compares each job's failed steps and reported findings with `tests/expectations.json`. The fixtures that must fail show as failed jobs, so the run itself ends failed; the Outcomes job is the verdict.
