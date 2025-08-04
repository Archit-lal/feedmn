import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Black app bar
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white), // White title color
        ),
        elevation: 0.0, // Remove shadow for a flat look
      ),
      body: Container(
        color: Colors.black, // Set background to black for the body
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile Avatar with teal border
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.teal, // Teal background for the avatar
                  child: Icon(
                    Icons.account_circle, 
                    size: 80, 
                    color: Colors.white, // White icon color
                  ),
                ),
                const SizedBox(height: 20),
                // Displaying the name with white text
                const Text(
                  'User Name',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White color for the name
                  ),
                ),
                const SizedBox(height: 10),
                // Displaying the email with lighter white color
                const Text(
                  'user.email@example.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70, // Light white text color for the email
                  ),
                ),
                const SizedBox(height: 40),
                // Edit Profile button with teal background
                ElevatedButton(
                  onPressed: () {
                    // Implement the functionality, such as editing the profile
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Teal button background
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded button corners
                    ),
                  ),
                  child: const Text(
                    'Edit Profile', // Button text
                    style: TextStyle(
                      color: Colors.white, // White text color on the button
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
