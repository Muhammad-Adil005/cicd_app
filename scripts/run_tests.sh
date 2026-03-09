#!/bin/bash

set -e

echo "🧪 Running Flutter Tests..."

# Get dependencies
flutter pub get

# Run tests with coverage
flutter test --coverage

# Generate HTML coverage report (requires lcov)
if command -v genhtml &> /dev/null; then
    echo "📊 Generating coverage report..."
    genhtml coverage/lcov.info -o coverage/html
    echo "✅ Coverage report generated at coverage/html/index.html"
else
    echo "⚠️  Install lcov to generate HTML coverage reports"
fi

echo "✅ Tests completed!"
