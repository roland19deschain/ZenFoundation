# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ZenFoundation is a small, dependency-free library of concise, reusable extensions for the Swift standard library and the Foundation framework. It ships as a static Swift Package (`ZenFoundation`) and is also distributed via CocoaPods. It contains no UI-framework code so it can support non-UI Apple platforms.

Deployment targets: iOS 14, tvOS 14, macOS 10.15, watchOS 6. Swift tools 5.10, Swift language version 5.

## Commands

Builds and tests are **not** run by default — only when explicitly requested. Per repo convention, prefix shell commands with `rtk` and use `rg` for searches.

- Build: `rtk swift build`
- Test: `rtk swift test` — **but first verify a test target exists.** There is currently no `Tests/` directory or test target; `swift test` will fail until one is added.
- Doc-only sanity check: `rtk git diff --check`

For source changes when a build was not authorized, perform static inspection and explicitly report that compilation/tests were not run.

## Architecture

The whole library is one SwiftPM target (`Sources/`) of pure extensions — no wrapper types, no executables, no resources, no external dependencies.

- `Sources/Foundation/<Type>/` — extensions of Foundation types (URL, NSPredicate, Scanner, FileManager, DateFormatter, Locale, CharacterSet, OperationQueue, UserDefaults, NSAttributedString).
- `Sources/Swift/<Type>/` — extensions of Swift stdlib types (String).

Each extension file is named `Type+Capability.swift` and lives under the directory of the type it extends. Files anywhere under `Sources/` are auto-included by the target path. Split unrelated capabilities into separate files rather than growing a generic convenience file. Prefer extensions over wrapper types.

## Public API & Compatibility (primary constraint)

This is a shipped library; treat **source compatibility as a primary constraint**. Assume every `public` declaration is downstream API.

- Do not rename, remove, narrow, or change semantics of existing public APIs unless the task explicitly calls for a breaking change. Prefer additive changes; keep forwarding deprecated APIs when replacing.
- Declarations inside a `public extension` are public unless given a narrower access level — add `public` deliberately.
- Preserve existing overload sets: several conveniences intentionally expose the same operation with different return/input types.
- Compatibility-sensitive surfaces to handle with extra care: the global `NSPredicate` operators, `URL: ExpressibleByStringLiteral`, and `String: LocalizedError`.
- Preserve observable details (query-item ordering, throwing-vs-optional behavior, thrown error types, filesystem traversal scope) unless the change explicitly alters them.
- Use availability annotations / conditional compilation for Foundation APIs unavailable on any supported deployment target.

## Style

- Indent with **tabs**. Follow the surrounding file's style — there is no formatter or linter.
- Preserve Xcode-inserted tabs on otherwise-blank separator lines; do not strip them in formatting-only edits.
- Opening braces on the declaration line; one argument/parameter per line for multiline calls.
- Write English doc comments for new public APIs, documenting behavior, units, defaults, errors, and edge cases rather than restating the symbol name.
- Keep diffs scoped to the requested behavior; avoid broad cleanup/modernization. Do not edit `Package.swift` metadata (deployment targets, versions, product type, dependencies) incidentally.

## Further Guidance

`AGENTS.md` contains the full, authoritative contributor guide (architecture, compatibility rules, test conventions, change discipline). Consult it for anything not covered here.
