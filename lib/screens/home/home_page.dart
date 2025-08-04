import 'package:flutter/material.dart';
import '../cart/cart_page.dart'; // Import CartPage
import '../post/post_page.dart'; // Import PostPage
import '/services/api_service.dart'; // Import the API service
import '/screens/account_page.dart'; // Import AccountPage

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Map<String, String>> posts = []; // List to hold the fetched posts
  final List<Map<String, String>> cart = []; // Cart list to store selected items

  // Initialize the ApiService instance
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    fetchFood(); // Fetch posts when the page is initialized
  }

  // Function to fetch posts from API
  void fetchFood() async {
    try {
      List<Map<String, String>> fetchedPosts = await apiService.fetchFood(); // This line calls fetchFood()
      setState(() {
        posts = fetchedPosts; // Update the posts list
      });
    } catch (e) {
      print('Error fetching posts: $e');
    }
  }

  // Method to build the AppBar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Text('FeedMN', style: TextStyle(color: Colors.white)),
      centerTitle: true,
      elevation: 0,
    );
  }

  // Method to display posts dynamically
  Widget _buildPostCard(Map<String, String> post) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.teal),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post['foodName']!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                post['description']!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quantity: ${post['quantity']}',
                    style: const TextStyle(color: Colors.teal, fontSize: 18),
                  ),
                  Text(
                    'Posted by: ${post['postedBy']}',
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Location: ${post['location']}',
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Add to Cart Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    cart.add(post); // Add post to the cart
                  });
                  apiService.addPostToCart(post); // Add to cart in the backend too
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Define pages for bottom navigation
  final List<Widget> _pages = [
    const Center(child: Text('Home Screen', style: TextStyle(color: Colors.white, fontSize: 20))),
    const PostPage(), // Post page
    CartPage(cart: []), // Empty cart initially
    AccountPage(), // AccountPage instead of placeholder
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.black,
      body: _selectedIndex == 0
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  posts.isNotEmpty
                      ? Column(
                          children: posts.map((post) => _buildPostCard(post)).toList(),
                        )
                      : const Center(
                          child: Text(
                            'No food available',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ],
              ),
            )
          : _pages[_selectedIndex], // Dynamic page rendering based on the selected index
      bottomNavigationBar: _selectedIndex == 1
          ? null // No bottom navigation bar on the PostPage
          : BottomNavigationBar(
              backgroundColor: Colors.black,
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                  if (_selectedIndex == 2) {
                    // Pass the cart to CartPage when navigating
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(cart: cart),
                      ),
                    );
                  } else if (_selectedIndex == 1) {
                    // Navigate to PostPage when Post icon is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PostPage()),
                    );
                  }
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_box, color: Colors.white),
                  label: 'Post',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle, color: Colors.white),
                  label: 'Account',
                ),
              ],
              selectedItemColor: Colors.teal,
              unselectedItemColor: Colors.white.withOpacity(0.6),
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
            ),
    );
  }
}
