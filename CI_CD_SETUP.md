# Flutter CI/CD Setup Guide

This project includes comprehensive CI/CD configurations for multiple platforms.

## 📋 Available CI/CD Platforms

### 1. GitHub Actions (`.github/workflows/flutter_ci.yml`)
- ✅ Automatic builds on push/PR
- ✅ Parallel Android & iOS builds
- ✅ Code analysis and testing
- ✅ Artifact uploads

**Setup:**
1. Push code to GitHub
2. Workflows run automatically
3. Download artifacts from Actions tab

### 2. GitLab CI (`.gitlab-ci.yml`)
- ✅ Multi-stage pipeline
- ✅ Coverage reports
- ✅ Artifact management

**Setup:**
1. Push code to GitLab
2. Pipeline runs automatically
3. View results in CI/CD > Pipelines

### 3. Codemagic (`codemagic.yaml`)
- ✅ Mac M1 instances for iOS
- ✅ Email notifications
- ✅ Automatic builds

**Setup:**
1. Connect repository to Codemagic
2. Configure email in `codemagic.yaml`
3. Builds trigger automatically

### 4. Bitbucket Pipelines (`bitbucket-pipelines.yml`)
- ✅ Parallel builds
- ✅ Branch-specific workflows

**Setup:**
1. Enable Pipelines in Bitbucket
2. Push code to trigger builds

### 5. Azure Pipelines (`azure-pipelines.yml`)
- ✅ Multi-stage builds
- ✅ Code coverage integration

**Setup:**
1. Create Azure DevOps project
2. Connect repository
3. Create pipeline from `azure-pipelines.yml`

### 6. CircleCI (`.circleci/config.yml`)
- ✅ Docker & macOS executors
- ✅ Workflow orchestration

**Setup:**
1. Connect repository to CircleCI
2. Builds run automatically

## 🛠️ Build Scripts

### Local Development Scripts

```bash
# Make scripts executable
chmod +x scripts/*.sh

# Run analysis
./scripts/analyze.sh

# Run tests
./scripts/run_tests.sh

# Build Android
./scripts/build_android.sh

# Build iOS (macOS only)
./scripts/build_ios.sh
```

## 📦 Fastlane Integration

Fastlane is configured for advanced deployment workflows.

### Android Lanes
```bash
# Build APK
fastlane android build_apk

# Build App Bundle
fastlane android build_appbundle

# Deploy to Play Store Internal Testing
fastlane android deploy_internal
```

### iOS Lanes
```bash
# Build iOS
fastlane ios build

# Deploy to TestFlight
fastlane ios deploy_testflight
```

## 🔧 Configuration Requirements

### For Android Deployment
1. **Play Store API Key**: Add to CI/CD secrets
   - `PLAY_STORE_CONFIG_JSON`

2. **Signing Keys**: Configure in `android/app/build.gradle.kts`
   ```kotlin
   signingConfigs {
       create("release") {
           storeFile = file(System.getenv("KEYSTORE_FILE") ?: "keystore.jks")
           storePassword = System.getenv("KEYSTORE_PASSWORD")
           keyAlias = System.getenv("KEY_ALIAS")
           keyPassword = System.getenv("KEY_PASSWORD")
       }
   }
   ```

### For iOS Deployment
1. **Apple Developer Account**: Required for TestFlight
2. **Certificates & Provisioning Profiles**: Configure in Fastlane
3. **App Store Connect API Key**: Add to CI/CD secrets

## 🔐 Required Secrets

Add these secrets to your CI/CD platform:

### GitHub Actions Secrets
- `PLAY_STORE_CONFIG_JSON` - Play Store service account JSON
- `KEYSTORE_FILE` - Android keystore (base64 encoded)
- `KEYSTORE_PASSWORD` - Keystore password
- `KEY_ALIAS` - Key alias
- `KEY_PASSWORD` - Key password
- `APPLE_ID` - Apple Developer ID
- `APPLE_APP_SPECIFIC_PASSWORD` - App-specific password
- `MATCH_PASSWORD` - Fastlane match password

## 📊 Pipeline Stages

All pipelines follow this structure:

1. **Analyze**: Code formatting & static analysis
2. **Test**: Unit tests with coverage
3. **Build Android**: APK & App Bundle
4. **Build iOS**: iOS app (requires macOS runner)

## 🚀 Quick Start

1. Choose your CI/CD platform
2. Add required secrets
3. Push code to trigger pipeline
4. Monitor build status
5. Download artifacts

## 📱 Build Outputs

### Android
- **APK**: `build/app/outputs/flutter-apk/app-release.apk`
- **AAB**: `build/app/outputs/bundle/release/app-release.aab`

### iOS
- **App**: `build/ios/iphoneos/Runner.app`

## 🔄 Workflow Triggers

- **Push to main/develop**: Full build & test
- **Pull Request**: Analysis & test only
- **Manual**: Workflow dispatch (GitHub Actions)

## 📝 Notes

- iOS builds require macOS runners (additional cost on some platforms)
- Android builds work on Linux runners (free tier available)
- Adjust Flutter version in configs as needed (currently 3.24.0)
- Coverage reports are generated automatically

## 🆘 Troubleshooting

### Build Fails
1. Check Flutter version compatibility
2. Verify all dependencies in `pubspec.yaml`
3. Review error logs in CI/CD platform

### iOS Build Issues
- Ensure macOS runner is available
- Check Xcode version compatibility
- Verify CocoaPods installation

### Android Build Issues
- Check Java version (requires Java 17)
- Verify Gradle configuration
- Check signing configuration

## 📚 Additional Resources

- [Flutter CI/CD Documentation](https://docs.flutter.dev/deployment/cd)
- [Fastlane Documentation](https://docs.fastlane.tools/)
- [GitHub Actions for Flutter](https://github.com/marketplace/actions/flutter-action)
