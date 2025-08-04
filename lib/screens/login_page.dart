import 'package:flutter/material.dart';
import '/screens/home/home_page.dart'; // Import HomePage

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // Email field
    final emailField = Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      elevation: 10.0,
      color: Color(0xFF2C2C2C),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 3, 0, 3),
        child: TextField(
          obscureText: false,
          style: TextStyle(color: Color(0xFFE1E1E1), fontFamily: 'Montserrat'),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(-5.0, 15.0, 10.0, 15.0),
            hintText: "Email",
            hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontFamily: 'Montserrat'),
            border: InputBorder.none,
            icon: Icon(Icons.mail_outline, color: Color(0xFFE1E1E1)),
          ),
        ),
      ),
    );

    // Password field
    final passwordField = Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      elevation: 10.0,
      color: Color(0xFF2C2C2C),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 3, 0, 3),
        child: TextField(
          obscureText: true,
          style: TextStyle(color: Color(0xFFE1E1E1), fontFamily: 'Montserrat'),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(-5.0, 15.0, 10.0, 15.0),
            hintText: "Password",
            hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontFamily: 'Montserrat'),
            border: InputBorder.none,
            icon: Icon(Icons.lock_outline, color: Color(0xFFE1E1E1)),
          ),
        ),
      ),
    );

    // Logo (Increased size)
    final logo = Container(
      width: 250.0, // Increased width
      height: 250.0, // Increased height
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/appstore.png'), // Ensure this path is correct
          fit: BoxFit.contain,
        ),
      ),
    );

    // Login button
    final loginButton = Material(
      elevation: 9.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.teal,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
        ),
        onPressed: () {
          // Navigate to the home page upon successful login (you can add login logic here)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()), // Replace with HomePage
          );
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFE1E1E1),
            fontSize: 16.0,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFF1D1D1D),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              logo, // Logo widget
              SizedBox(height: 45.0),
              emailField, // Email field widget
              SizedBox(height: 25.0),
              passwordField, // Password field widget
              SizedBox(height: 75.0),
              loginButton, // Login button widget
              SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}
