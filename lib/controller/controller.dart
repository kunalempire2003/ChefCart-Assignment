import 'package:get/get.dart';
import '../model/dish_details.dart';
import '../model/food_Item.dart';
import '../model/popular_food_item.dart';
import '../repository/repository.dart';

class FoodController extends GetxController {
  final FoodRepository _repository = FoodRepository();

  // Reactive variables
  var foodList = <FoodItem>[].obs;
  var selectedFood = Rxn<DishDetail>(); // nullable Rx
  var isLoading = false.obs;
  var error = ''.obs;
  var popularFoodList = <PopularFoodItem>[].obs;
var isSelected=false;
var count=0.obs;
  // Fetch all food items



  @override
  void onInit(){
    super.onInit();
    fetchFoodList();

  }
  void fetchFoodList() async {
    try {
      isLoading.value = true;
      final list = await _repository.getFoodItems();
      foodList.value = list;
      final popularList = await _repository.getPopularFoodItems();
      popularFoodList.value = popularList;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch single food item by ID
  Future fetchFoodDetails(int id) async {
    try {
      isLoading.value = true;
      final food = await _repository.getFoodItemById(id);
      selectedFood.value = food;
      isLoading.value = false;

    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  String getFoodFilter(int i){

    switch (i) {
      case 0:
       return "Italian" ;
// break is generally required for non-empty cases
      case 1:
        return "Indian";
      case 2:
        return "Chinese";
      case 3:
        return "Desi";
      default:
        return '';


    }}
}
