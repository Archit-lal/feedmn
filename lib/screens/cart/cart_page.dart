import 'package:flutter/material.dart';
import '../home/home_page.dart'; // Import the HomePage for navigation
import '../checkout_page.dart'; // Import the CheckoutPage for navigation

class CartPage extends StatefulWidget {
  final List<Map<String, String>> cart;

  const CartPage({super.key, required this.cart});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Method to remove an item from the cart
  void _removeFromCart(Map<String, String> post) {
    setState(() {
      widget.cart.remove(post);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevents the gray bottom bar
      backgroundColor: Colors.black, // Background color for dark theme
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Your Cart',
          style: TextStyle(
            color: Colors.teal,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()), // Navigate back to HomePage
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cart item list
              Expanded(
                child: widget.cart.isEmpty
                    ? const Center(
                        child: Text(
                          'Your cart is empty',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      )
                    : ListView.builder(
                        itemCount: widget.cart.length,
                        itemBuilder: (context, index) {
                          final post = widget.cart[index];
                          return Card(
                            color: Colors.black,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15), // Rounded corners
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Cart item name and quantity
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        post['foodName']!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Quantity: ${post['quantity']}',
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Price and delete button
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        '\$10.00', // Example price, you can replace this with actual price if needed
                                        style: TextStyle(
                                          color: Colors.teal,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.teal,
                                        ),
                                        onPressed: () {
                                          _removeFromCart(post); // Remove post from cart
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
              
              // Checkout Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to CheckoutPage when pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckoutPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded button
                    ),
                  ),
                  child: const Text(
                    'Proceed to Checkout',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text on the button
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
