import 'dart:convert';
import 'package:http/http.dart' as http;

class MyService {
  static const String baseUrl =
      "https://8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io/dishes/v1";

  /// ---------------- ALL DISHES ----------------
  Future<Map<String, dynamic>> fetchAllFoodItems() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return _hardcodedAllDishes();
      }
    } catch (e) {
      return _hardcodedAllDishes();
    }
  }

  /// ---------------- DISH BY ID ----------------
  Future<Map<String, dynamic>> fetchFoodItemById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$id'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return _hardcodedDishDetail();
      }
    } catch (e) {
      return _hardcodedDishDetail();
    }
  }

  /// ---------------- HARDCODED RESPONSES ----------------

  Map<String, dynamic> _hardcodedAllDishes() {
    return {
      "dishes": [
        {
          "name": "Masala Mughlai",
          "rating": 4.2,
          "description":
          "Chicken fried in deep tomato sauce with delicious spices",
          "equipments": ["Refrigerator", "Microwave"],
          "image":
          "https://img.freepik.com/free-photo/top-view-delicious-corn-dog_23-2149387975.jpg",
          "id": 1
        },
        {
          "name": "Masala Paneer",
          "rating": 4.3,
          "description": "Paneer tossed in gravy",
          "equipments": ["Microwave"],
          "image":
          "https://img.freepik.com/free-photo/top-view-delicious-corn-dog_23-2149387975.jpg",
          "id": 2
        },

      ],
      "popularDishes": [
        {
          "name": "Biryani",
          "image":
          "https://img.freepik.com/free-photo/top-view-delicious-corn-dog_23-2149387975.jpg",
          "id": 3
        },
        {
          "name": "Daal Batti",
          "image":
          "https://img.freepik.com/free-photo/top-view-delicious-corn-dog_23-2149387975.jpg",
          "id": 4
        },
        {
          "name": "Veg Korma",
          "image":
          "https://img.freepik.com/free-photo/top-view-delicious-corn-dog_23-2149387975.jpg",
          "id": 5
        },
        {
          "name": "Chicken Korma",
          "image":
          "https://img.freepik.com/free-photo/top-view-delicious-corn-dog_23-2149387975.jpg",
          "id": 6
        }
      ]
    };
  }

  Map<String, dynamic> _hardcodedDishDetail() {
    return {
      "name": "Masala Mughlai",
      "id": 1,
      "timeToPrepare": "1 Hour",
      "ingredients": {
        "vegetables": [
          {"name": "Cauliflower", "quantity": "1"},
          {"name": "Tomato", "quantity": "10"},
          {"name": "Spinach", "quantity": "1/2 Kg"}
        ],
        "spices": [
          {"name": "Coriander", "quantity": "100 gm"},
          {"name": "Mustard Oil", "quantity": "1/2 litres"}
        ],
        "appliances": [
          {"name": "Refrigerator", "image": ""},
          {"name": "Microwave", "image": ""},
          {"name": "Stove", "image": ""}
        ]
      }
    };
  }
}
