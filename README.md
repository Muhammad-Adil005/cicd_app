# Flutter CI/CD App

A Flutter application with comprehensive CI/CD pipeline configurations for multiple platforms.

## 🚀 Features

- ✅ Complete CI/CD setup for 6+ platforms
- ✅ Automated testing and code analysis
- ✅ Android APK & App Bundle builds
- ✅ iOS builds with TestFlight support
- ✅ Fastlane integration
- ✅ Code coverage reports
- ✅ Build scripts for local development

## 📋 Supported CI/CD Platforms

- GitHub Actions
- GitLab CI
- Codemagic
- Bitbucket Pipelines
- Azure Pipelines
- CircleCI

## 🛠️ Getting Started

### Prerequisites

- Flutter SDK (3.24.0 or higher)
- Dart SDK
- Android Studio / Xcode
- Git

### Installation

```bash
# Clone the repository
git clone <your-repo-url>
cd cicd_app

# Get dependencies
flutter pub get

# Run the app
flutter run
```

## 🏗️ Building

### Android
```bash
# Build APK
flutter build apk --release

# Build App Bundle
flutter build appbundle --release

# Or use the script
./scripts/build_android.sh
```

### iOS
```bash
# Build iOS
flutter build ios --release --no-codesign

# Or use the script
./scripts/build_ios.sh
```

## 🧪 Testing

```bash
# Run tests
flutter test

# Run tests with coverage
flutter test --coverage

# Or use the script
./scripts/run_tests.sh
```

## 🔍 Code Analysis

```bash
# Analyze code
flutter analyze

# Format code
dart format .

# Or use the script
./scripts/analyze.sh
```

## 📦 CI/CD Setup

See [CI_CD_SETUP.md](CI_CD_SETUP.md) for detailed instructions on configuring CI/CD pipelines.

## 📁 Project Structure

```
cicd_app/
├── .github/workflows/     # GitHub Actions workflows
├── .circleci/            # CircleCI configuration
├── fastlane/             # Fastlane configuration
├── scripts/              # Build and test scripts
├── lib/                  # Flutter application code
├── test/                 # Test files
├── android/              # Android native code
├── ios/                  # iOS native code
├── codemagic.yaml        # Codemagic configuration
├── .gitlab-ci.yml        # GitLab CI configuration
├── azure-pipelines.yml   # Azure Pipelines configuration
└── bitbucket-pipelines.yml # Bitbucket Pipelines configuration
```

## 🔐 Environment Variables

Required for deployment:

- `KEYSTORE_FILE` - Android keystore
- `KEYSTORE_PASSWORD` - Keystore password
- `KEY_ALIAS` - Key alias
- `KEY_PASSWORD` - Key password
- `PLAY_STORE_CONFIG_JSON` - Play Store service account
- `APPLE_ID` - Apple Developer ID
- `APPLE_APP_SPECIFIC_PASSWORD` - App-specific password

## 📝 License

This project is licensed under the MIT License.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📧 Contact

For questions or support, please open an issue in the repository.
