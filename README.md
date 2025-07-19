# Device & Sensor App

A Flutter application that demonstrates native integration using platform channels to fetch device information and control the flashlight.

## Features
- **Dashboard Screen**: Displays battery percentage, device name, and OS version with a Lottie loading animation.
- **Sensor Screen**: Toggles the device's flashlight with animated UI feedback.
- Uses `Provider` for state management.
- Includes unit tests for device info fetching.
- Minimal native code in Kotlin (Android) and Swift (iOS).

## Prerequisites
- Flutter SDK (version 3.0.0 or higher)
- Android Studio or Xcode for native platform setup
- A Lottie animation file (`loading.json`) placed in the `assets/` folder

## Setup Instructions
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd device_sensor_app
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Add a Lottie animation file (`loading.json`) to the `assets/` folder. You can download one from [LottieFiles](https://lottiefiles.com).
4. Configure permissions:
    - **Android**: Add camera permission to `android/app/src/main/AndroidManifest.xml`:
      ```xml
      <uses-permission android:name="android.permission.CAMERA"/>
      <uses-feature android:name="android.hardware.camera"/>
      ```
    - **iOS**: Add camera and flashlight permissions to `ios/Runner/Info.plist`:
      ```xml
      <key>NSCameraUsageDescription</key>
      <string>Used to access the flashlight</string>
      ```
5. Run the app:
   ```bash
   flutter run
   ```

## Usage
- **Dashboard Screen**: Press the floating action button to fetch and display device info (battery level, device name, OS version).
- **Sensor Screen**: Navigate to the sensor screen via the button and toggle the flashlight. The UI shows an animated circle indicating the flashlight state.

## Testing
Run unit tests to verify device info fetching:
```bash
flutter test
```

## Project Structure
- `lib/main.dart`: Entry point and app setup
- `lib/models/device_info_model.dart`: State management for device and sensor data
- `lib/screens/`: Contains UI for dashboard and sensor screens
- `android/app/src/main/kotlin/`: Android native code (Kotlin)
- `ios/Runner/`: iOS native code (Swift)
- `test/`: Unit tests for the device info model

## Dependencies
- `provider`: For state management
- `lottie`: For loading animations

## Notes
- Ensure the device has a flashlight for the sensor screen to work.
- The app uses platform channels for native integration, following Flutter's documentation: [Platform Channels](https://docs.flutter.dev/platform-integration/platform-channels).
```