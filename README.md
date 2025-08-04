# FeedMN 🍽️

A Flutter-based mobile application designed to reduce food waste by connecting people who have surplus food with those who need it. FeedMN promotes community sharing and sustainability.

## 🌟 Features

- **Food Sharing**: Post surplus food items with descriptions, quantities, and locations
- **Browse & Claim**: Discover available food items in your area
- **User Authentication**: Secure login and registration system
- **Cart System**: Add items to cart before claiming
- **Location-based**: Find food items near you
- **Real-time Updates**: Stay updated with the latest food postings

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.2.3)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code
- iOS Simulator (for iOS development)
- Android Emulator (for Android development)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/FeedMN.git
   cd FeedMN
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure environment**
   - Update the API base URL in `lib/config/app_config.dart` for your environment
   - Set the appropriate environment (development, staging, production)

4. **Run the app**
   ```bash
   flutter run
   ```

## 🏗️ Project Structure

```
lib/
├── config/
│   └── app_config.dart          # Environment configuration
├── models/
│   └── food_post.dart           # Data models
├── repositories/                # Data layer
├── screens/
│   ├── home/                    # Home screen
│   ├── login_page.dart          # Authentication
│   ├── post/                    # Food posting
│   ├── cart/                    # Shopping cart
│   └── profile_page.dart        # User profile
├── services/
│   └── api_service.dart         # API communication
├── shared/
│   ├── theme/                   # App theming
│   └── widgets/                 # Reusable components
└── state/                       # State management
```

## 🔧 Configuration

### Environment Setup

The app supports multiple environments:

- **Development**: Uses ngrok tunnel for local development
- **Staging**: For testing before production
- **Production**: Live environment

Update the `AppConfig` class in `lib/config/app_config.dart` to configure your API endpoints.

### API Configuration

Update the base URLs in `lib/config/app_config.dart`:

```dart
static String get apiBaseUrl {
  switch (_environment) {
    case Environment.development:
      return "https://your-dev-api.com";
    case Environment.staging:
      return "https://your-staging-api.com";
    case Environment.production:
      return "https://your-production-api.com";
  }
}
```

## 📱 Building for Production

### Android

```bash
flutter build apk --release
```

### iOS

```bash
flutter build ios --release
```

### Web

```bash
flutter build web --release
```

## 🧪 Testing

Run the test suite:

```bash
flutter test
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- The open-source community for various packages
- Contributors and beta testers

## 📞 Support

For support, email support@feedmn.com or create an issue in this repository.

---

**FeedMN** - Reducing food waste, one meal at a time. 🍎
