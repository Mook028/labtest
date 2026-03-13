<<<<<<< HEAD
# labtest

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
=======
# Product Requirement Document (PRD)

# 📱 Smart Class Check-in & Learning Reflection App

> A mobile application for university attendance verification using GPS + QR code, with pre/post-class learning reflection forms.

---

## 🧩 Problem Statement

Traditional attendance methods (name-calling, paper sign-in sheets) are inefficient and easy to abuse — students can sign in for friends or leave right after checking in. They also capture no learning signal beyond presence.

This app solves both problems with:
- **Dual verification** (GPS + QR code) to confirm physical presence
- **Learning reflection forms** to capture what students actually learned

---

## 👥 Target Users

| User | Role |
|------|------|
| 🎓 **University Students** | Check in quickly via smartphone; submit reflections after class |
| 👩‍🏫 **Instructors** | Monitor attendance reliability; review student mood & reflections |

---

## ✨ Features

### 3.1 Check-in System
Students tap **Check-in** to begin attendance. The system records their GPS coordinates and a timestamp.

### 3.2 QR Code Verification
Students scan a QR code provided by the instructor to confirm physical presence in the classroom. Combined with GPS, this prevents remote or proxy check-ins.

### 3.3 Pre-Class Check-in Form
Before class begins, students fill in:
- Topic covered in the **previous** class
- What they **expect to learn** in the current class

### 3.4 Mood Scale
Students select their emotional state before class on a 5-point scale:

| Score | Emoji | Mood |
|:-----:|:-----:|------|
| 1 | 😡 | Very Negative |
| 2 | 😟 | Negative |
| 3 | 😐 | Neutral |
| 4 | 🙂 | Positive |
| 5 | 😄 | Very Positive |

### 3.5 End-of-Class Reflection
After class, students tap **Finish Class**, re-scan the QR code, then write a short reflection:
- What they learned during the class
- Any feedback about the class or instructor

---

## 🔄 User Flow

```
┌─────────────────────────────────────────────┐
│               CHECK-IN PHASE                │
├─────────────────────────────────────────────┤
│  1. Open app → Press Check-in button        │
│  2. System records GPS location + timestamp │
│  3. Scan instructor's QR code               │
│  4. Fill pre-class form + select mood       │
├─────────────────────────────────────────────┤
│             END-OF-CLASS PHASE              │
├─────────────────────────────────────────────┤
│  5. Press Finish Class                      │
│  6. Re-scan QR code + GPS recorded          │
│  7. Write learning reflection + feedback    │
└─────────────────────────────────────────────┘
```

---

## 🗃️ Data Fields

| Field | Type | Captured At |
|-------|------|-------------|
| Student ID | String | App login |
| Check-in Timestamp | DateTime | Check-in |
| Check-out Timestamp | DateTime | Finish Class |
| GPS Location (check-in) | Lat/Lng | Check-in |
| GPS Location (check-out) | Lat/Lng | Finish Class |
| Previous Class Topic | Text | Pre-class form |
| Expected Topic | Text | Pre-class form |
| Student Mood | Integer (1–5) | Pre-class form |
| Learning Reflection | Text | Post-class form |
| Instructor Feedback | Text | Post-class form |

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|------------|
| **Mobile Framework** | Flutter |
| **Local Storage (MVP)** | SQLite / Local Storage |
| **Cloud / Web** | Firebase Hosting |
| **Location** | GPS / Geolocation |
| **Verification** | QR Code Scanner |

> **MVP Note:** Local SQLite storage is sufficient for the initial version. Firebase may be introduced in later phases for cloud sync and a web-based instructor dashboard.

---

## 📁 Project Structure *(planned)*

```
smart_checkin/
├── lib/
│   ├── screens/
│   │   ├── checkin_screen.dart
│   │   ├── reflection_screen.dart
│   │   └── home_screen.dart
│   ├── models/
│   │   ├── attendance.dart
│   │   └── reflection.dart
│   ├── services/
│   │   ├── gps_service.dart
│   │   ├── qr_service.dart
│   │   └── storage_service.dart
│   └── main.dart
├── pubspec.yaml
└── README.md
```

---

## 🚀 Getting Started

```bash
# Clone the repository
git clone https://github.com/your-username/smart-checkin-app.git

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

## 📄 License

This project is developed as part of a university course project.
---
>>>>>>> 9568f770c98038945f1385876bef3888168350a2
