# SwiftLint `explicit_self` false positive (string interpolation)

Minimal repro for the SwiftLint [**`explicit_self`**](https://realm.github.io/SwiftLint/explicit_self.html) analyzer rule reporting a violation even when the instance member is **already** accessed with `self.` inside string interpolation.

## What goes wrong

In `Sources/ExplicitSelfStringInterpolationBug/StringInterpolation.swift`, `description` returns a string that interpolates `self.foo`:

```swift
return "StringInterpolation{foo: \(self.foo)}"
```

The member is explicitly qualified with `self.` inside the `\(...)` expression. Running `swiftlint analyze` still produces an **`explicit_self`** finding (e.g. “Instance variables and functions should be explicitly accessed with `self.`”) at the interpolation site.

**Expected:** No `explicit_self` violation; `self` is already explicit.

**Actual:** `explicit_self` reports a violation (false positive).

`explicit_self` is an **analyzer** rule: it only runs with `swiftlint analyze` and compiler invocation data, not with `swiftlint lint`.

## How to reproduce

1. Clone this repository.
2. From the repo root, run:

   ```bash
   ./build.sh
   ```

   The script performs a clean `xcodebuild` (macOS, Swift package scheme), writes the full build log, then runs `swiftlint analyze --compiler-log-path` against [`.swiftlint.yml`](.swiftlint.yml), which enables `explicit_self` with error severity.

3. SwiftLint exits non-zero and prints the violation on `StringInterpolation.swift`.

Requirements: Xcode, SwiftLint, and a shell (tested on macOS).

## Repository layout

| Path | Purpose |
|------|---------|
| [`Package.swift`](Package.swift) | Swift package definition |
| [`Sources/.../StringInterpolation.swift`](Sources/ExplicitSelfStringInterpolationBug/StringInterpolation.swift) | Minimal repro code |
| [`.swiftlint.yml`](.swiftlint.yml) | Enables `explicit_self` (analyzer, severity error) |
| [`build.sh`](build.sh) | `xcodebuild` clean build + `swiftlint analyze` |

## License

This repo is a tiny repro for bug reporting; use it however you like.
