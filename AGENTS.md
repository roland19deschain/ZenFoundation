# ZenFoundation Agent Guide

## Scope

These instructions apply to the entire repository.

ZenFoundation is a small, dependency-free library of public Swift and Foundation extensions. It is distributed as a static Swift Package named `ZenFoundation`.

Treat source compatibility as a primary constraint. Existing public extensions, global operators, overloads, conformances, names, and behavior may be used directly by downstream applications.

## Repository Map

- `Package.swift` — Swift tools 5.10 manifest, package platforms, products, and targets.
- `Sources/Foundation/<Type>/` — extensions of Foundation types, grouped by the extended type.
- `Sources/Swift/<Type>/` — extensions of Swift standard-library types.
- `README.md` — short package overview.

The package has one source target and no test target. It has no external package dependencies, generated sources, resources, executable targets, or checked-in Xcode project.

## Architecture and Source Organization

- Keep the library focused on concise, reusable Foundation and Swift conveniences.
- Prefer extensions over wrapper types when adding behavior consistent with the existing API.
- Put a new API under the directory for the type it extends.
- Name extension files `Type+Capability.swift`, matching the existing layout.
- Split unrelated capabilities into separate files rather than growing a generic convenience file.
- Import `Foundation` directly in source files that use Foundation APIs.
- Do not add third-party dependencies without explicit user approval.
- Avoid adding Apple UI framework dependencies; the library supports non-UI Apple platforms.
- Do not add generated files or Xcode user/workspace artifacts to the repository.

## Public API and Compatibility

- Assume every `public` declaration is shipped API.
- Do not rename, remove, narrow, or change the semantics of existing public APIs unless the task explicitly calls for a breaking change.
- Preserve existing overload sets. Several conveniences intentionally expose the same operation with different return types or input types.
- Treat the global `NSPredicate` operators and the `URL: ExpressibleByStringLiteral` and `String: LocalizedError` conformances as compatibility-sensitive.
- Prefer additive changes. If an API must be replaced, keep a forwarding deprecated API when practical and document the migration.
- Add `public` deliberately. Declarations inside a `public extension` are public unless given a narrower access level.
- Use availability annotations or conditional compilation when a new Foundation API is unavailable on any supported deployment target.
- Preserve observable details such as query-item ordering, thrown errors, optional-vs-throwing behavior, and filesystem traversal scope unless the requested change explicitly alters them.

## Package Metadata

Current SwiftPM deployment targets are:

- iOS 14;
- tvOS 14;
- macOS 10.15;
- watchOS 6.

When a task intentionally changes deployment targets, Swift language/tool versions, source layout, product type, or dependencies, update `Package.swift` as part of the same focused change. Do not edit this metadata incidentally.

Files added anywhere under `Sources/` are automatically included by the SwiftPM target path.

## Swift Style

- Follow the style of the surrounding file; there is no repository formatter or linter configuration.
- Use tabs for indentation.
- Preserve Xcode-inserted tabs on otherwise blank separator lines in Swift files. Do not strip them in formatting-only edits.
- Keep opening braces on the declaration line.
- For multiline calls and declarations, place one argument or parameter per line and align continuation structure as in neighboring code.
- Keep one blank line between logical sections and before a closing type or extension brace, matching existing files.
- Write documentation comments in English for new public APIs.
- Document behavior, units, default values, errors, and non-obvious edge cases rather than restating the symbol name.
- Avoid broad formatting cleanup, typo correction, or modernization outside the requested scope.

## Tests

- No test target or `Tests/` directory is currently configured.
- Do not recreate an empty test target as incidental cleanup.
- When a task explicitly requires automated coverage, add a `ZenFoundationTests` test target in `Package.swift`, place focused XCTest files under `Tests/`, and use `@testable import ZenFoundation`.
- Name tests after the extended type or capability, and cover success, boundary, and failure behavior relevant to the change.
- For filesystem APIs, create isolated temporary fixtures and remove them after the test.
- Keep tests deterministic: do not depend on the user's locale, time zone, home-directory contents, free disk capacity, network, or test execution order.
- When behavior is locale- or time-zone-sensitive, pass explicit values.
- For public API changes, include a test that demonstrates the intended call site where practical.

Do not claim regression coverage that was not added and run.

## Commands and Validation

- Prefix shell commands with `rtk`.
- Use `rg` or `rg --files` for repository searches.
- Do not run Xcode builds, SwiftPM builds, or `swift test` unless the user explicitly asks for them.
- If builds are explicitly requested, use `rtk swift build`.
- If tests are explicitly requested, first verify that the current package has a test target; then use `rtk swift test`.
- For documentation-only changes, inspect the diff and run `rtk git diff --check`.
- For source changes when builds were not authorized, perform static inspection and clearly report that compilation and tests were not run.
- Do not introduce a formatter or linter merely to validate a focused change.

## Change Discipline

- Inspect `git status` before editing and preserve unrelated user changes.
- Keep diffs limited to the requested behavior.
- Do not edit release versions, deployment targets, package product type, or dependency policy incidentally.
- Do not commit, tag, push, or publish unless explicitly requested.
- In the final report, list changed files and state exactly which validation was performed, including any build or test omission required by these instructions.
