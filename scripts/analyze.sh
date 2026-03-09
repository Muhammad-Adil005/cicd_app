#!/bin/bash

set -e

echo "🔍 Running Flutter Analysis..."

# Get dependencies
flutter pub get

# Format check
echo "📝 Checking code formatting..."
dart format --output=none --set-exit-if-changed .

# Analyze
echo "🔎 Analyzing code..."
flutter analyze

echo "✅ Analysis completed!"
