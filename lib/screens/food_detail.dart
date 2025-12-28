import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../Utils/colors.dart';
import '../controller/controller.dart';
import '../model/dish_details.dart';

class FoodDetailScreen extends StatelessWidget {
  FoodDetailScreen({super.key});

  final FoodController controller = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Get.back(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Obx(() {
        final DishDetail? food = controller.selectedFood.value;
        if (food == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section with background-style image on right
              SizedBox(
                height: Get.height*0.26,
                child: Stack(
                  children: [


                    Positioned(
                      top:170
                      ,

                      child: Container(
                        height: 3,
                        width: Get.width,
                        color: colorFromHex("#F2F2F2"),
                      ),
                    ),
            Positioned(
              left: 180,
              child: IgnorePointer(
                child: Container(
                  height: 192,
                  width: 192,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // better than borderRadius here
                    color: colorFromHex("#FFF9F1"),
                  ),
                ),
              ),
            ),

                    // Positioned image on the right
                    Positioned(
                      top:Get.height*0.1
                      ,
                      left: Get.width*0.51,

                      child: Opacity(
                        opacity: 0.9, // subtle background effect
                        child: IgnorePointer(
                          child: Image.asset(
                            "assets/images/Mask Group 17@2x.png",
                            height: 130,
                          ),
                        ),

                      ),
                    ),
                    Positioned(
                      left: Get.width*0.75,
                      top:27,
                      child: Opacity(
                        opacity: 1, // subtle background effect
                        child: IgnorePointer(
                          child: Image.asset(
                            "assets/images/pngtree-herbal-ingredients-transparent-image-png-image_3206949-removebg-preview@2x.png",
                            width: 215,
                            height: 215,
                          ),
                        ),

                      ),
                    ),


                    // Text content layered on top
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                food.name,
                                style: const TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.w900),
                              ),
                              const SizedBox(width: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: colorFromHex("#51C452"),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  "4.2",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 6),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: Get.width*0.51,
                            child: Text(
                             "Mughlai Masala is a style of cookery developed in the Indian Subcontinent by the imperial kitchens of the Mughal Empire.",
                              style:  TextStyle(
                                  fontSize: 8.2, color: colorFromHex("#A3A3A3")),
                            ),
                          ),
                          // Time to Prepare

                          const SizedBox(height: 30,),
                          Row(
                            children: [
                            SvgPicture.asset(
                            'assets/icons/Group 393.svg',

                          ),                             const SizedBox(width: 6),
                              Text(
                                food.timeToPrepare.toLowerCase(),
                                style: const TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),




              // Ingredients Section
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ingredients",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                     Text(
                      "For 2 people",
                      style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold,color: colorFromHex("#8A8A8A")),
                    ),
                    const SizedBox(height: 13),

                   Divider(color: colorFromHex("#D6D6D6CE"),),
                    const SizedBox(height: 13),

                    // Vegetables
                    _buildIngredientSection(
                        "Vegetables", food.ingredients.vegetables,),

                    const SizedBox(height: 12),

                    // Spices
                    _buildIngredientSection("Spices", food.ingredients.spices),

                    const SizedBox(height: 12),

                    // Appliances
                    const Text(
                      "Appliances",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: food.ingredients.appliances.length,
                        itemBuilder: (context, index) {
                          final appliance = food.ingredients.appliances[index];
                          return  Container(
                            margin: const EdgeInsets.only(right: 21),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            height: 95,
                            width: 72,
                            color: colorFromHex("#F5F5F5"),
                            child: Column(
                              children: [

                                Image.asset(
                                  "assets/images/Mask Group 20@2x.png"  ,
                                  height: 55,
                                  width: 30,

                                ),
                                Text(appliance.name,style: const TextStyle(fontSize: 8),),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // Helper widget for vegetables and spices
  Widget _buildIngredientSection(String title, List<dynamic> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "$title (${items.length})",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 6,),
            const Icon(Icons.arrow_drop_down_sharp)
          ],
        ),
        const SizedBox(height: 8),
        ...items.map(
              (item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.name, style:  TextStyle(fontSize: 10,color: colorFromHex("#1C1C1C"))),
                Text(item.quantity, style:  TextStyle(fontSize: 10,color: colorFromHex("#1C1C1C"))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
