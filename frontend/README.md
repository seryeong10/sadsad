# A-VATA Frontend

Flutter client for the A-VATA avatar face replacement MVP.

## Run

```bash
flutter pub get
flutter run
```

The app currently calls the backend at `http://10.0.2.2:8000/generate-avatar`, which is the Android emulator address for a local server. Change `lib/services/avatar_api_service.dart` if you run on iOS simulator, desktop, web, or a physical device.

## Structure

- `lib/main.dart`: app entry point and global theme.
- `lib/pages/`: screen widgets such as gender selection, photo upload, avatar result, avatar tab, and mood tab.
- `lib/services/`: backend/API communication. `avatar_api_service.dart` belongs here.
- `lib/widgets/`: reusable UI pieces shared by pages.
- `assets/avatars/`: bundled base avatar images.

## Assets

The base avatars are bundled through `pubspec.yaml`:

- `assets/avatars/male_base.png`
- `assets/avatars/female_base.png`
