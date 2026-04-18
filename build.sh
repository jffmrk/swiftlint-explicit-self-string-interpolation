#!/usr/bin/env bash
set -uo pipefail

cd "$(dirname "$0")"

SCHEME="${SCHEME:-ExplicitSelfStringInterpolationBug}"
DESTINATION="${DESTINATION:-platform=macOS}"
CONFIGURATION="${CONFIGURATION:-Debug}"
LOG_FILE="${LOG_FILE:-xcodebuild.log}"

echo ""
echo "Building..."
echo ""

xcodebuild \
  -scheme "$SCHEME" \
  -destination "$DESTINATION" \
  -configuration "$CONFIGURATION" \
  clean build \
  COMPILER_INDEX_STORE_ENABLE=NO \
  2>&1 | tee "$LOG_FILE"
xcode_status=$?

if [ "$xcode_status" -ne 0 ]; then
  echo "xcodebuild failed (exit $xcode_status)"
  exit "$xcode_status"
fi

echo "=="
echo "== swiftlint analyze"
echo "=="

swiftlint analyze \
  --compiler-log-path "$LOG_FILE" \
  --config "${SWIFTLINT_CONFIG:-.swiftlint.yml}"
swiftlint_status=$?

if [ "$swiftlint_status" -ne 0 ]; then
  echo ""
  echo "🔴 swiftlint analyze failed - false positive explicit_self rule"
  echo ""
  exit "$swiftlint_status"
fi

echo ""
echo "swiftlint analyze succeeded"
echo ""
