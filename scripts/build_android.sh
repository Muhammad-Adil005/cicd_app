#!/bin/bash

set -e

echo "🚀 Building Android App..."

# Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Run code generation if needed
# flutter pub run build_runner build --delete-conflicting-outputs

# Build APK
echo "📱 Building APK..."
flutter build apk --release

# Build App Bundle
echo "📦 Building App Bundle..."
flutter build appbundle --release

echo "✅ Android build completed!"
echo "📍 APK location: build/app/outputs/flutter-apk/app-release.apk"
echo "📍 AAB location: build/app/outputs/bundle/release/app-release.aab"
