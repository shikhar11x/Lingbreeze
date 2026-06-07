<div align="center">

<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
<img src="https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white"/>
<img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black"/>

# 📚 LingoBreeze

**A vocabulary learning app to save and review words you want to learn.**

</div>

---

## ✨ Features

- 📝 Add new words with meaning and translation
- 📖 View all saved words in a clean modern list
- ⏳ Loading, empty, and error states handled
- 🔄 Pull to refresh
- 🪟 Modal bottom sheet for adding words
- ☁️ Firebase Firestore for cloud storage

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|------------|
| 📱 Frontend | Flutter |
| 🔄 State Management | Provider |
| ⚙️ Backend | Node.js + Express |
| 🗄️ Database | Firebase Firestore |
| 🏗️ Architecture | Clean Architecture |

---

## 📸 Screenshots

<table>
  <tr>
    <td align="center"><b>Vocabulary List</b></td>
    <td align="center"><b>Add New Word</b></td>
    <td align="center"><b>Word Saved</b></td>
    <td align="center"><b>Updated List</b></td>
  </tr>
  <tr>
    <td><img src="preview/1.jpg" width="200"/></td>
    <td><img src="preview/2.jpg" width="200"/></td>
    <td><img src="preview/3.jpg" width="200"/></td>
    <td><img src="preview/4.jpg" width="200"/></td>
  </tr>
</table>

---

## 📁 Project Structure

```text
lingbreeze/
├── flutter_app/
│   ├── lib/
│   │   ├── core/
│   │   │   └── constants.dart
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   └── word_model.dart
│   │   │   └── repositories/
│   │   │       └── word_repository.dart
│   │   ├── presentation/
│   │   │   ├── providers/
│   │   │   │   └── word_provider.dart
│   │   │   └── screens/
│   │   │       ├── vocabulary_screen.dart
│   │   │       └── widgets/
│   │   │           ├── word_card.dart
│   │   │           ├── add_word_sheet.dart
│   │   │           └── empty_state.dart
│   │   └── main.dart
│   ├── android/
│   ├── ios/
│   └── pubspec.yaml
├── backend/
│   ├── index.js
│   └── package.json
├── .gitignore
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter 3.x+
- Node.js 18+
- Firebase project with Firestore enabled

---

### ⚙️ Backend Setup

```bash
cd backend
npm install
```

> Add `serviceAccountKey.json` in the `backend/` folder:
> - Firebase Console → Project Settings → Service Accounts
> - Click **"Generate new private key"**
> - Save as `serviceAccountKey.json` inside `backend/`

```bash
node index.js
# Server runs on http://localhost:3000
```

---

### 🔌 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/words` | Fetch all saved words |
| `POST` | `/words` | Save a new word |

**POST /words — Request Body:**

```json
{
  "word": "Apple",
  "meaning": "A round fruit",
  "translation": "Manzana"
}
```

---

### 📱 Flutter App Setup

```bash
cd flutter_app
flutter pub get
```

Update `lib/core/constants.dart`:

```dart
class AppConstants {
  // Android emulator
  static const String baseUrl = 'http://10.0.2.2:3000';

  // Real device — use your WiFi IP
  // static const String baseUrl = 'http://192.168.1.XX:3000';
}
```

```bash
flutter run
```

---

## ⚠️ Notes

- `serviceAccountKey.json` is **not committed** for security reasons
- Phone and laptop must be on the **same WiFi network** for real device testing
- Backend must be **running** before launching the Flutter app

---

## 📦 Built With

<div align="center">

[Flutter](https://flutter.dev) • [Provider](https://pub.dev/packages/provider) • [Firebase Firestore](https://firebase.google.com/docs/firestore) • [Node.js](https://nodejs.org) • [Express](https://expressjs.com)

</div>
