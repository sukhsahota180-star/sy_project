# Platform Setup & Deployment Guide

## iOS Setup

### Requirements
- macOS 11.0+
- Xcode 13.0+
- iOS Deployment Target: 11.0+
- CocoaPods

### Setup Steps

1. **Install Xcode Command Line Tools**
```bash
xcode-select --install
```

2. **Update iOS deployment target**

Edit `ios/Podfile`:
```ruby
post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
    target.build_configurations.each do |config|
      config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
        '$(inherited)',
        'PERMISSION_CAMERA=1',
      ]
    end
  end
end
```

3. **Build & Deploy**
```bash
flutter build ipa --release
```

## Android Setup

### Requirements
- Android SDK 21+
- Android Gradle Plugin 7.0+
- Java 11+

### Setup Steps

1. **Set Environment Variables**

Windows:
```bash
set ANDROID_HOME=C:\Android\sdk
```

macOS/Linux:
```bash
export ANDROID_HOME=$HOME/Library/Android/sdk
```

2. **Accept Licenses**
```bash
flutter doctor --android-licenses
```

3. **Update `android/app/build.gradle`**

Ensure minSdkVersion is 21+:
```gradle
android {
    compileSdkVersion 33
    
    defaultConfig {
        minSdkVersion 21
        targetSdkVersion 33
    }
}
```

4. **Build & Deploy**

Debug APK:
```bash
flutter build apk --debug
```

Release APK:
```bash
flutter build apk --release
```

App Bundle (for Google Play):
```bash
flutter build appbundle --release
```

## Web Deployment

### Firebase Hosting

1. **Install Firebase CLI**
```bash
npm install -g firebase-tools
```

2. **Initialize Firebase**
```bash
firebase login
firebase init hosting
```

3. **Build & Deploy**
```bash
flutter build web --release
firebase deploy
```

### Vercel

1. **Build Flutter Web**
```bash
flutter build web --release
```

2. **Create `vercel.json`**
```json
{
  "buildCommand": "flutter build web --release",
  "outputDirectory": "build/web"
}
```

3. **Deploy**
```bash
npm i -g vercel
vercel
```

### Netlify

1. **Build**
```bash
flutter build web --release
```

2. **Deploy**
```bash
npm i -g netlify-cli
netlify deploy --prod --dir=build/web
```

## Windows Desktop Deployment

### Requirements
- Windows 10+
- Visual Studio (or Build Tools) with C++ desktop development tools
- Windows 10 SDK

### Build

```bash
flutter build windows --release
```

Output: `build/windows/runner/Release/sy_projects.exe`

### Create Installer

Use Inno Setup or NSIS to create Windows installer.

**inno_setup.iss example:**
```ini
[Setup]
AppName=SY Projects
AppVersion=1.0.0
OutputDir=output
OutputBaseFilename=sy_projects_installer

[Files]
Source: "build\windows\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
```

## macOS Desktop Deployment

### Requirements
- macOS 10.13+
- Xcode 11.0+
- Apple Developer Account (for distribution)

### Build

```bash
flutter build macos --release
```

Output: `build/macos/Build/Products/Release/sy_projects.app`

### Create DMG

```bash
# Create a symlink to Applications
ln -s /Applications build/macos/Build/Products/Release/Applications

# Create DMG
hdiutil create -volname "SY Projects" -srcfolder build/macos/Build/Products/Release -ov -format UDZO sy_projects.dmg
```

## Linux Desktop Deployment

### Requirements
- Linux (Ubuntu 18.04+ recommended)
- GCC 4.8+
- GTK 3.0+

### Build

```bash
flutter build linux --release
```

Output: `build/linux/x64/release/bundle/sy_projects`

### Create AppImage

1. **Install linuxdeploy**
```bash
wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage
chmod +x linuxdeploy-x86_64.AppImage
```

2. **Create AppImage**
```bash
./linuxdeploy-x86_64.AppImage --appdir=build/linux/x64/release/bundle --output=appimage
```

## Release Checklist

- [ ] Update version in `pubspec.yaml`
- [ ] Update `version` in `lib/main.dart`
- [ ] Run `flutter pub upgrade`
- [ ] Test all platforms in release mode
- [ ] Generate app icons and splash screens
- [ ] Write release notes
- [ ] Tag git commit with version
- [ ] Build for all platforms
- [ ] Upload to app stores / distribution channels
- [ ] Monitor analytics and error reports

## App Store Submissions

### iOS App Store

1. Create App Store Connect account
2. Create app in App Store Connect
3. Build and archive in Xcode
4. Upload to App Store Connect
5. Submit for review

### Google Play Store

1. Create Google Play Developer account
2. Create app in Google Play Console
3. Upload app bundle or APK
4. Add store listing (description, screenshots, etc.)
5. Submit for review

### Microsoft Store (Windows)

1. Create Windows Developer account
2. Create app in Microsoft Store
3. Upload MSIX package
4. Add store listing
5. Submit for certification

## Continuous Integration

### GitHub Actions Example

Create `.github/workflows/build.yml`:

```yaml
name: Build

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test
      - run: flutter build apk --release
      - run: flutter build web --release
```

## Monitoring & Analytics

### Firebase Analytics

The app is configured to use Firebase Analytics. To enable:

1. Create Firebase project
2. Add Firebase configuration to app
3. Initialize Firebase in `main.dart`
4. Track custom events as needed

### Crash Reporting

Use Firebase Crashlytics to monitor app crashes:

```dart
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

FirebaseCrashlytics.instance.recordError(error, stackTrace);
```

## Performance Optimization

### Code

- Use `const` constructors
- Implement proper dispose methods
- Use `RepaintBoundary` for complex widgets
- Enable code obfuscation in release builds

### Assets

- Compress images and videos
- Use WebP format where possible
- Lazy load large assets

### Build

```bash
# Release build with obfuscation
flutter build apk --release --obfuscate --split-debug-info=debugSymbols/
```

## Security

- Never commit sensitive keys or tokens
- Use environment variables for configuration
- Implement certificate pinning for API calls
- Validate all user inputs
- Use HTTPS for all API requests
- Implement proper error handling

## Support

For deployment issues:
- Contact: sukhsahota180@gmail.com
- Phone: +91 8437 584 541
