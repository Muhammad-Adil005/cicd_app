.PHONY: help clean get analyze test build-android build-ios run

help:
	@echo "Available commands:"
	@echo "  make get           - Get Flutter dependencies"
	@echo "  make analyze       - Run code analysis"
	@echo "  make test          - Run tests with coverage"
	@echo "  make build-android - Build Android APK and AAB"
	@echo "  make build-ios     - Build iOS app"
	@echo "  make clean         - Clean build artifacts"
	@echo "  make run           - Run the app"
	@echo "  make format        - Format code"

get:
	flutter pub get

clean:
	flutter clean
	flutter pub get

analyze:
	dart format --output=none --set-exit-if-changed .
	flutter analyze

test:
	flutter test --coverage

format:
	dart format .

build-android:
	flutter build apk --release
	flutter build appbundle --release

build-ios:
	flutter build ios --release --no-codesign

run:
	flutter run

run-release:
	flutter run --release
