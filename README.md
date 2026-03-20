# 🌿 Lumen — Personal Diary App

A minimal, beautiful diary app built with Flutter. Write your thoughts, track your days, and keep your memories safe — all stored locally on your device.

---

## ✨ Features

- 📝 **Write, edit & delete** diary entries
- 👋 **Personalized greetings** using your name
- 🌙 **Light & Dark theme** with persistent preference
- 🔍 **Browse entries** sorted by latest first
- 🚀 **Onboarding flow** — set up once, jump in every time after
- 💾 **Fully offline** — all data stored locally using Drift (SQLite)

---

## 📸 Screenshots

> Coming soon

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter |
| State Management | Riverpod |
| Local Database | Drift (SQLite) |
| Navigation | Native Navigator |
| Bottom Nav | google_nav_bar |
| Fonts | Google Fonts (Lora) |

---

## 📁 Project Structure

```
lib/
├── core/
│   └── app_theme.dart          # Light & dark theme definitions
├── database/
│   ├── app_db.dart             # Drift database + all queries
│   └── tables/
│       ├── diary_entries.dart  # Diary entries table
│       └── user_model.dart     # User profile table
├── providers/
│   ├── database_provider.dart  # DB + diary + user providers
│   ├── nav_provider.dart       # Bottom nav state
│   └── theme_provider.dart     # Theme mode state
├── screens/
│   ├── onboarding_screen.dart  # First launch onboarding
│   ├── name_screen.dart        # Name setup screen
│   ├── home_screen.dart        # Main scaffold + bottom nav
│   ├── diary_screen.dart       # Entries list + greeting
│   ├── add_diary_screen.dart   # Write new entry
│   └── profile_screen.dart     # Profile + settings
├── utils/
│   └── diary_card.dart         # Entry card widget
└── main.dart
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.0.0`
- Dart SDK `>=3.0.0`
- Android Studio or VS Code

### Installation

1. Clone the repo
```bash
git clone https://github.com/theprogrammizz/lumen_flutter.git
cd lumen_flutter
```

2. Install dependencies
```bash
flutter pub get
```

3. Run code generation for Drift
```bash
dart run build_runner build
```

4. Run the app
```bash
flutter run
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter_riverpod: ^3.3.1
  drift: ^2.32.0
  sqlite3_flutter_libs: ^0.5.42
  path_provider: ^2.1.5
  path: ^1.9.1
  google_nav_bar: any
  google_fonts: any

dev_dependencies:
  drift_dev: ^2.32.0
  build_runner: ^2.4.13
```

---

## 🗺️ Roadmap

- [ ] Search entries
- [ ] Mood tagging
- [ ] Edit existing entries
- [ ] Biometric lock
- [ ] Backup to Google Drive
- [ ] Entry detail screen

---

## 👤 Author

**Dev** (theprogrammiz)
- GitHub: [@theprogrammizz](https://github.com/theprogrammizz)

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).