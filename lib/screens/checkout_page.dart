import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pickupHeader = Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context); // Go back to previous page
              },
            ),
            Text(
              "Pickup",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
            SizedBox(width: 48.0),
          ],
        ),
        SizedBox(height: 10.0),
        Divider(color: Colors.tealAccent, thickness: 1.0), // Divider with teal accent color
      ],
    );

    // Method to build each section (Pickup Location, Contact Information, etc.)
    Widget buildSection(String title, IconData icon, Widget content) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8), // Dark background for sections
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.teal),
                SizedBox(width: 10.0),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    decoration: TextDecoration.underline, // Underlined title
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            content,
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black, // Main background color
      body: SafeArea(  // Wrap the whole body with SafeArea to avoid notch overlap
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: pickupHeader,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: [
                    buildSection(
                      "Pickup Location",
                      Icons.location_on,
                      Text(
                        "Bailey Hall, N303, 1458 Cleveland Ave N, Saint Paul, MN",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    buildSection(
                      "Contact Information",
                      Icons.person,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Event Host: John Doe",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "Phone: +1 612-229-5115",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "Email: johndoe@example.com",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    buildSection(
                      "Pickup Time",
                      Icons.access_time,
                      Text(
                        "10:00 AM - 10:30 AM",
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 18.0,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shadowColor: Colors.tealAccent,
                    elevation: 15.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.apple, color: Colors.white, size: 28.0),
                      SizedBox(width: 10.0),
                      Text(
                        "Pay with Apple Pay",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
