#!/bin/bash

# FeedMN Production Build Script
# This script builds the app for production deployment

set -e

echo "🚀 Starting FeedMN production build..."

# Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Set production environment
echo "⚙️ Setting production environment..."
# Note: In a real CI/CD pipeline, you would set this via environment variables
# For now, we'll manually update the config

# Build for Android
echo "🤖 Building Android APK..."
flutter build apk --release

# Build for Android App Bundle (recommended for Play Store)
echo "📱 Building Android App Bundle..."
flutter build appbundle --release

# Build for iOS (requires macOS and Xcode)
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "🍎 Building iOS..."
    flutter build ios --release
else
    echo "⚠️ Skipping iOS build (requires macOS)"
fi

# Build for Web
echo "🌐 Building Web version..."
flutter build web --release

echo "✅ Production build completed!"
echo ""
echo "📁 Build outputs:"
echo "  Android APK: build/app/outputs/flutter-apk/app-release.apk"
echo "  Android Bundle: build/app/outputs/bundle/release/app-release.aab"
echo "  Web: build/web/"
echo ""
echo "🎉 Ready for deployment!" 