
import '../model/dish_details.dart';
import '../model/food_Item.dart';
import '../model/popular_food_item.dart';
import '../service/service.dart';


class FoodRepository {
  final MyService _apiService = MyService();


  // Fetch all dishes
  Future<List<FoodItem>> getFoodItems() async {
    final response = await _apiService.fetchAllFoodItems();

    if (response['dishes'] != null && response['dishes'] is List) {
      final List list = response['dishes'];
      return list.map((e) => FoodItem.fromJson(e)).toList();
    } else {
      return [];
    }
  }


  Future<List<PopularFoodItem>> getPopularFoodItems() async {
    final response = await _apiService.fetchAllFoodItems();

    if (response['popularDishes'] != null && response['popularDishes'] is List) {
      final List list = response['popularDishes'];
      return list.map((e) => PopularFoodItem.fromJson(e)).toList();
    } else {
      return [];
    }
  }


  // Fetch single dish by id
  Future<DishDetail> getFoodItemById(int id) async {
    final response = await _apiService.fetchFoodItemById(id);

    // The API returns the dish object directly
    return DishDetail.fromJson(response);
    }
}
