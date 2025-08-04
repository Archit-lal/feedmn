import 'package:flutter/material.dart';
import 'profile_page.dart'; // Import ProfilePage
import 'login_page.dart'; // Import LoginPage for navigation

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background to black
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            _buildListTile(
              context,
              Icons.account_circle,
              'Profile',
              () {
                // Navigate to ProfilePage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            const SizedBox(height: 20),
            // Notifications Section
            _buildListTile(
              context,
              Icons.notifications,
              'Notifications',
              () {
                // Add functionality for notifications
              },
            ),
            const SizedBox(height: 20),
            // Security Section
            _buildListTile(
              context,
              Icons.security,
              'Security',
              () {
                // Add functionality for security settings
              },
            ),
            const SizedBox(height: 20),
            // Logout Section
            _buildListTile(
              context,
              Icons.logout,
              'Logout',
              () {
                // Navigate to the Login Page when logout is clicked
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build list tile with proper spacing and style
  Widget _buildListTile(BuildContext context, IconData icon, String title, Function() onTap) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        tileColor: Colors.black.withOpacity(0.8),
        leading: Icon(icon, color: Colors.teal),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        onTap: onTap,
      ),
    );
  }
}
