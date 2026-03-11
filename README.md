# Firebase Setup for Flutter

## Prerequisites
- Node.js (LTS) installed from https://nodejs.org
- Flutter project created

## 1. Install Firebase CLI
```bash
sudo npm install -g firebase-tools
```

## 2. Login to Firebase
```bash
firebase login
```

## 3. Install FlutterFire CLI
```bash
dart pub global activate flutterfire_cli
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

## 4. Create Firebase Project
Go to https://console.firebase.google.com and create a new project.

## 5. Configure Flutter App
Inside your Flutter project run:
```bash
flutterfire configure
```
Select your Firebase project when prompted. This generates `lib/firebase_options.dart`.

## 6. Add Firebase Packages
```bash
flutter pub add firebase_core
flutter pub add firebase_auth
```

## 7. Initialize Firebase in main.dart
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
```