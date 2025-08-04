enum Environment { development, staging, production }

class AppConfig {
  static Environment _environment = Environment.development;
  
  static void setEnvironment(Environment env) {
    _environment = env;
  }
  
  static Environment get environment => _environment;
  
  static String get apiBaseUrl {
    switch (_environment) {
      case Environment.development:
        return "https://your-dev-api-url.com"; // Replace with your development API URL
      case Environment.staging:
        return "https://staging-api.feedmn.com"; // Replace with your staging URL
      case Environment.production:
        return "https://api.feedmn.com"; // Replace with your production URL
    }
  }
  
  static String get appName {
    switch (_environment) {
      case Environment.development:
        return "FeedMN (Dev)";
      case Environment.staging:
        return "FeedMN (Staging)";
      case Environment.production:
        return "FeedMN";
    }
  }
  
  static bool get isDebugMode {
    return _environment == Environment.development;
  }
  
  static Duration get apiTimeout {
    switch (_environment) {
      case Environment.development:
        return const Duration(seconds: 30);
      case Environment.staging:
        return const Duration(seconds: 15);
      case Environment.production:
        return const Duration(seconds: 10);
    }
  }
} 