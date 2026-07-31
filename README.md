# 🎙️ VoicePilot AI

**VoicePilot AI** is an intelligent voice and text assistant Flutter application built with Clean Architecture, Riverpod state management, and Material 3 design tokens.

---

## 🌟 Key Features

- ⚡ **Animated Voice Assistant**: Custom glowing pulse AI Orb with multi-state animations (`idle`, `listening`, `thinking`, `speaking`).
- 💬 **Text Chat Interface**: Multi-turn text chat experience with message history and quick actions.
- 🎨 **Modern Dark Theme**: Rich dark UI palette powered by custom tokens ([AppColors](file:///f:/uiprojects/voicepilot_ai/lib/core/theme/app_colors.dart), [AppTypography](file:///f:/uiprojects/voicepilot_ai/lib/core/theme/app_typography.dart), [AppShadows](file:///f:/uiprojects/voicepilot_ai/lib/core/theme/app_shadows.dart)).
- 📱 **Responsive Design**: Auto-scaling layout suitable for mobile devices and tablets.
- 🔐 **Authentication & Onboarding Flow**: Splash screen, interactive onboarding slides, language selection (`English` / `Urdu`), login, signup, and password recovery.
- 🏗️ **Clean Architecture**: Decoupled features structure (`presentation`, `domain`, `data`, `shared`, `core`).

---

## 📱 Navigation & App Flow

```
Splash ➔ Onboarding ➔ Language ➔ Login ➔ Signup / Forgot Password ➔ Home ➔ Voice Assistant / Text Chat / History / Profile / Settings
```

---

## 📂 Project Architecture

```
lib/
├── core/
│   ├── constants/       # App-wide constants & assets
│   ├── network/         # API clients & network configurations
│   ├── router/          # Route management
│   ├── services/        # Service abstractions
│   ├── theme/           # Design system tokens (Colors, Typography, Radius, Spacing)
│   └── utils/           # Utility functions & helpers
├── features/
│   ├── auth/            # Login, Signup, Forgot Password
│   ├── chat/            # Text Chat feature
│   ├── history/         # Conversation history
│   ├── home/            # Home screen, quick actions, greeting header, recent chats
│   ├── language/        # Language selection
│   ├── onboarding/      # Onboarding screens
│   ├── profile/         # User profile
│   ├── settings/        # App settings
│   ├── splash/          # Splash page with animated logo & orb
│   └── voice_assistant/ # Voice assistant interface
└── shared/
    ├── providers/       # Global state providers
    └── widgets/         # Shared UI components (AiOrb, ProfileAvatar, BottomNavBar, SectionHeader)
```

---

## 🛠️ Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (`>=3.0.0`)
- Dart SDK (`>=3.0.0`)

### Installation & Environment Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/zilerehman2005/VoicePilotAI.git
   cd VoicePilotAI
   ```

2. **Setup Environment Variables**:
   Copy `.env.example` to `.env` and fill in your credentials:
   ```bash
   cp .env.example .env
   ```
   > ⚠️ **Security Warning**: `.env` and sensitive API keys/credentials are ignored by `.gitignore`. Never commit API keys or secret credentials directly into version control.

3. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

4. **Run the App**:
   ```bash
   flutter run
   ```

5. **Run Static Analysis & Tests**:
   ```bash
   flutter analyze
   flutter test
   ```

---

## 🌿 Git & Feature Branching Guidelines

Recommended branching structure for contribution:

- `main` / `master`: Production-ready releases.
- `feature/home-screen`: Home screen design and quick action widgets.
- `feature/voice-assistant`: Voice orb animations and audio processing logic.
- `feature/text-chat`: Text chat UI, providers, and API integration.
- `feature/auth-flow`: Authentication, onboarding, and language selection.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
