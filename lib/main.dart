import 'package:flutter/material.dart';
import 'screens/home/home_page.dart'; // Import your home page
import 'screens//login_page.dart'; // Import LoginPage
import 'config/app_config.dart';

void main() {
  // Set environment based on build configuration
  // In production, this would be set via build arguments or environment variables
  AppConfig.setEnvironment(Environment.development);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: AppConfig.isDebugMode, // Show debug banner only in debug mode
      title: AppConfig.appName,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Set LoginPage as the initial page
      home: LoginPage(), // Initial screen is LoginPage
    );
  }
}
