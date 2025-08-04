class FoodPost {
  final String foodName;
  final String description;
  final int quantity;
  final String location;
  final String postedBy;
  final int foodLeft;
  final String? imagePath;  // Image path if an image is picked

  FoodPost({
    required this.foodName,
    required this.description,
    required this.quantity,
    required this.location,
    required this.postedBy,
    required this.foodLeft,
    this.imagePath,
  });
}
