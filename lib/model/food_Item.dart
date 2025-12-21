class FoodItem {
  final int id;
  final String name;
  final String description;
  final String image;
  final double rating;
  final List<String> equipments;

  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
    required this.equipments,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      equipments: List<String>.from(json['equipments'] ?? []),
    );
  }
}
