class PopularFoodItem {
  final int id;
  final String name;
  final String image;

  PopularFoodItem({
    required this.id,
    required this.name,
    required this.image,
  });

  factory PopularFoodItem.fromJson(Map<String, dynamic> json) {
    return PopularFoodItem(
      id: json['id'],
      name: json['name'],
      image: json['image'] ?? 'https://picsum.photos/400/300',
    );
  }
}
