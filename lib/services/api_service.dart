import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/app_config.dart';

class ApiService {
  final String baseUrl = AppConfig.apiBaseUrl;

  // Function to fetch food posts from API
  Future<List<Map<String, String>>> fetchFood() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/food'),
      ).timeout(AppConfig.apiTimeout);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<Map<String, String>> posts = [];

        // If data is available in the response
        if (data['data'] != null) {
          for (var post in data['data']) {
            posts.add({
              'foodName': post['food_name'] ?? 'No Name', // Corrected key: 'food_name'
              'description': post['description'] ?? 'No Description', // Corrected key: 'description'
              'quantity': post['quantity']?.toString() ?? '0', // Quantity converted to string
              'location': post['location'] ?? 'Unknown Location', // Corrected key: 'location'
              'postedBy': post['posted_by']?.toString() ?? 'Anonymous', // Corrected key: 'posted_by'
              //'foodLeft': post['claimed'] == 0 ? post['quantity']?.toString() : '0', // 'claimed' handling
              'imageUrl': post['image_url'] ?? '', // Handling image URL (if any)
            });
          }
          return posts;
        } else {
          throw Exception('No food data available');
        }
      } else {
        throw Exception('Failed to load posts. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load posts: $e');
    }
  }

  // Function to create a new food listing (POST request)
  Future<void> createFood(Map<String, String> foodData) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/food'),
        body: json.encode(foodData),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(AppConfig.apiTimeout);

      print("🔥 Status Code: ${response.statusCode}");
      print("🔥 Response Body: ${response.body}");

      if (response.statusCode == 201) {
        print('✅ Food created successfully!');
      } else {
        throw Exception('❌ Failed to create food listing. Status Code: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('❌ Error creating food listing: $e');
    }
  }

  // Function to add post to cart (POST request)
  Future<void> addPostToCart(Map<String, String> post) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/cart'),
        body: json.encode(post),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(AppConfig.apiTimeout);

      if (response.statusCode == 200) {
        print('Post added to cart');
      } else {
        throw Exception('Failed to add post to cart. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to add post to cart: $e');
    }
  }
}
