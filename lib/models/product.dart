class Product {
  final String id;
  final String name;
  final String image;
  final double rating;
  final String reviews; // e.g., "10k+"
  final int price;
  final int? originalPrice;
  final bool isVeg;
  final bool isDiscounted;
  final String description; // For detail view if needed

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.price,
    this.originalPrice,
    required this.isVeg,
    this.isDiscounted = false,
    this.description = "",
  });
}

class Category {
  final String name;
  final String image;

  Category({required this.name, required this.image});
}
