import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Utils/colors.dart';

import '../controller/controller.dart';
import 'Components/food_type_buttons.dart';
import 'Components/main_food_item_card.dart';

class FoodListScreen extends StatelessWidget {
  FoodListScreen({super.key});

  final FoodController foodController = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,

      // ---------------- APP BAR ----------------
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        forceMaterialTransparency: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Select Dishes',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),

      // ---------------- BOTTOM BAR ----------------
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 38),
          child: Container(
            height: 40,
            width: 239,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(7),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/Group 377@2x.png",
                        width: 16,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '3 food items selected',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.arrow_forward, size: 16, color: Colors.white),
                ],
              ),
            ),
          ),
        ),
      ),

      // ---------------- BODY ----------------
      body: Obx(() {
        if (foodController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (foodController.error.value.isNotEmpty) {
          return Center(child: Text(foodController.error.value));
        }

        final popular = foodController.popularFoodList;
        final foods = foodController.foodList;

        return ListView(
          children: [

            // ---------------- HEADER ----------------
            SizedBox(
              height: 83,
              child: Stack(
                children: [
                  IgnorePointer(
                    ignoring: true,
                    child: Container(
                      height: 42,
                      width: Get.width,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    top: 19,
                    child: SizedBox(
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: Get.width * 0.87,
                            height: 63,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.6),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: colorFromHex("#D6D6D6CE"),
                                  offset: const Offset(0, 1),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons/Select_date-01.png",
                                      height: 16,
                                    ),
                                    const SizedBox(width: 9),
                                    const Text(
                                      "21 May 2021",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 26,
                                  width: 1,
                                  color: colorFromHex("#D6D6D6CE"),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons/Set_time-01@2x.png",
                                      height: 16,
                                    ),
                                    const SizedBox(width: 9),
                                    const Text(
                                      "10:30 Pm-12:30 Pm",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ---------------- FOOD TYPE BUTTONS ----------------
            SizedBox(
              height: 24,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: popular.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: FoodTypeButtons(
                      foodType: foodController.getFoodFilter(index),
                      isSelected: index == 0,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Text(
                "Popular Dishes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),

            const SizedBox(height: 15),

            // ---------------- POPULAR DISHES ----------------
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: popular.length,
                  itemBuilder: (context, index) {
                    final item = popular[index];
                    return Container(
                      width: 59,
                      margin: const EdgeInsets.only(right: 8),
                      child: CircleAvatar(
                        radius: 29,
                        backgroundImage: NetworkImage(item.image),
                        child: CircleAvatar(
                          radius: 28.5,
                          backgroundColor: Colors.black.withOpacity(0.4),
                          child: Text(
                            item.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.white, fontSize: 8),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 18),

            Divider(
              color: colorFromHex("#F2F2F2"),
              thickness: 3,
            ),

            const SizedBox(height: 10),

            // ---------------- RECOMMENDED HEADER ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        "Recommended",
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                  Container(
                    height: 22,
                    width: 56,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Center(
                      child: Text(
                        "Menu",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ---------------- MAIN FOOD LIST ----------------
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: foods.length,
              itemBuilder: (context, index) {
                return MainFoodItemCard(foodItem: foods[index]);
              },
            ),
          ],
        );
      }),
    );
  }
}
