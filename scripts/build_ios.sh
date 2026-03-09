#!/bin/bash

set -e

echo "🚀 Building iOS App..."

# Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Install iOS pods
echo "📦 Installing CocoaPods..."
cd ios
pod install
cd ..

# Build iOS
echo "📱 Building iOS..."
flutter build ios --release --no-codesign

echo "✅ iOS build completed!"
echo "📍 Build location: build/ios/iphoneos/Runner.app"
