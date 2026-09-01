# Quick Start Guide - SY Projects Flutter App

## Prerequisites

Before you begin, make sure you have:
- Flutter 3.0+ installed
- Dart 3.0+ (comes with Flutter)
- An IDE (VS Code, Android Studio, or IntelliJ)
- For mobile testing: Android emulator or physical device / iOS simulator or physical device
- For web: Chrome or Firefox browser

## Installation Steps

### 1. Install Flutter

**Windows:**
```bash
# Download from https://flutter.dev/docs/get-started/install/windows
# Or use winget:
winget install Google.Flutter
```

**macOS:**
```bash
brew install flutter
```

**Linux:**
```bash
sudo snap install flutter --classic
```

Verify installation:
```bash
flutter doctor
```

### 2. Clone/Setup This Project

```bash
cd sy_projects_flutter
```

### 3. Get Dependencies

```bash
flutter pub get
```

### 4. Generate Models

Since we use JSON serialization, generate the model files:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Running the App

### Development Mode

```bash
# Run on default connected device
flutter run

# Run with debug info
flutter run -v

# Run with specific device
flutter run -d <device-id>
```

### Hot Reload

While the app is running, press:
- `r` - Hot reload
- `R` - Hot restart
- `q` - Quit

### List Available Devices

```bash
flutter devices
```

## Platform-Specific Setup

### Android

1. **Install Android Studio** or Android SDK
2. **Set ANDROID_HOME**:
   ```bash
   # Windows
   set ANDROID_HOME=C:\Android\sdk
   
   # macOS/Linux
   export ANDROID_HOME=$HOME/Library/Android/sdk
   ```
3. **Accept licenses**:
   ```bash
   flutter doctor --android-licenses
   ```
4. **Run**:
   ```bash
   flutter run -d emulator-5554
   ```

### iOS

1. **Install Xcode**: `xcode-select --install`
2. **Install CocoaPods** (if on macOS):
   ```bash
   sudo gem install cocoapods
   ```
3. **Navigate to iOS folder**:
   ```bash
   cd ios
   pod install
   cd ..
   ```
4. **Run**:
   ```bash
   flutter run -d iPhone
   ```

### Web

1. **Enable web support** (if not already):
   ```bash
   flutter config --enable-web
   ```
2. **Run**:
   ```bash
   flutter run -d chrome
   ```
3. **Access**: http://localhost:5000

### Windows Desktop

1. **Enable Windows support**:
   ```bash
   flutter config --enable-windows-desktop
   ```
2. **Run**:
   ```bash
   flutter run -d windows
   ```

### macOS Desktop

1. **Enable macOS support**:
   ```bash
   flutter config --enable-macos-desktop
   ```
2. **Run**:
   ```bash
   flutter run -d macos
   ```

### Linux Desktop

1. **Install dependencies**:
   ```bash
   sudo apt-get install clang cmake git pkg-config libgtk-3-dev libblkid-dev
   ```
2. **Enable Linux support**:
   ```bash
   flutter config --enable-linux-desktop
   ```
3. **Run**:
   ```bash
   flutter run -d linux
   ```

## Common Commands

```bash
# Clean build
flutter clean

# Get latest dependencies
flutter pub get

# Upgrade dependencies
flutter pub upgrade

# Check code quality
flutter analyze

# Format code
dart format .

# Run tests
flutter test

# Build for production
flutter build apk --release    # Android
flutter build ipa --release    # iOS
flutter build web --release    # Web
flutter build windows --release # Windows
flutter build macos --release  # macOS
flutter build linux --release  # Linux
```

## Configuration

### API Endpoint

The app connects to your Next.js backend. To change the endpoint:

Edit `lib/config/app_config.dart`:

```dart
baseUrl: const String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'https://sy-projects.vercel.app',
),
```

Or pass during run:
```bash
flutter run --dart-define=API_BASE_URL=http://your-backend-url
```

### Environment Variables

Create a `.env` file if using flutter_dotenv:
```
API_BASE_URL=https://your-backend-url
```

## Debugging

### Enable Debug Mode

```bash
flutter run
```

### Use DevTools

```bash
flutter pub global activate devtools
devtools
```

Then open http://localhost:9101

### Check Logs

```bash
flutter logs
```

## Troubleshooting

### Issue: "Flutter not found"
**Solution**: Add Flutter to PATH
```bash
export PATH="$PATH:[flutter-installation-directory]/bin"
```

### Issue: Android emulator not running
**Solution**: Start emulator manually
```bash
emulator -list-avds
emulator -avd <avd-name>
```

### Issue: iOS pod install fails
**Solution**: Update CocoaPods
```bash
cd ios
rm -rf Podfile.lock
pod install
cd ..
```

### Issue: Web app not loading
**Solution**: Clear cache and rebuild
```bash
flutter clean
flutter run -d chrome
```

### Issue: API calls failing
**Solution**: 
- Ensure backend is running
- Check network connectivity
- Verify correct API URL in config
- Check browser console for CORS errors (web)

## Testing

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/services/api_service_test.dart

# Run with coverage
flutter test --coverage
```

## Performance

### Profile Mode
```bash
flutter run --profile
```

### Release Mode
```bash
flutter run --release
```

Use DevTools to monitor performance:
```bash
flutter pub global activate devtools
devtools
```

## Next Steps

1. Explore the `lib/` directory to understand the project structure
2. Check `README.md` for detailed architecture documentation
3. Review API endpoints in `lib/services/api_service.dart`
4. Customize themes in `lib/main.dart`
5. Add new screens following existing patterns

## Support

For issues or questions:
- Check Flutter documentation: https://flutter.dev/docs
- Contact: sukhsahota180@gmail.com
- Phone: +91 8437 584 541

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Riverpod Guide](https://riverpod.dev)
- [Go Router Documentation](https://pub.dev/packages/go_router)
- [Dio HTTP Client](https://github.com/flutterchina/dio)
