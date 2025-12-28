class DishDetail {
  final String name;
  final int id;
  final String timeToPrepare;
  final Ingredients ingredients;

  DishDetail({
    required this.name,
    required this.id,
    required this.timeToPrepare,
    required this.ingredients,
  });

  factory DishDetail.fromJson(Map<String, dynamic> json) {
    return DishDetail(
      name: json['name'],
      id: json['id'],
      timeToPrepare: json['timeToPrepare'],
      ingredients: Ingredients.fromJson(json['ingredients']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'timeToPrepare': timeToPrepare,
      'ingredients': ingredients.toJson(),
    };
  }
}

class Ingredients {
  final List<Item> vegetables;
  final List<Item> spices;
  final List<Appliance> appliances;

  Ingredients({
    required this.vegetables,
    required this.spices,
    required this.appliances,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
      vegetables: (json['vegetables'] as List)
          .map((e) => Item.fromJson(e))
          .toList(),
      spices: (json['spices'] as List).map((e) => Item.fromJson(e)).toList(),
      appliances: (json['appliances'] as List)
          .map((e) => Appliance.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vegetables': vegetables.map((e) => e.toJson()).toList(),
      'spices': spices.map((e) => e.toJson()).toList(),
      'appliances': appliances.map((e) => e.toJson()).toList(),
    };
  }
}

class Item {
  final String name;
  final String quantity;

  Item({
    required this.name,
    required this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
    };
  }
}

class Appliance {
  final String name;
  final String image;

  Appliance({
    required this.name,
    required this.image,
  });

  factory Appliance.fromJson(Map<String, dynamic> json) {
    return Appliance(
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
