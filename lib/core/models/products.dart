class Product {
  final int id;
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      imageUrl: json['image_url'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.00,
      description: json['description'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'image_url': imageUrl,
      'price': price,
      'description': description,
    };
  }
}
