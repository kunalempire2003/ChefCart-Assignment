import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_app/Utils/colors.dart';
import '../../controller/controller.dart';
import '../../model/food_Item.dart';

class MainFoodItemCard extends StatelessWidget {
  final FoodItem foodItem;
  final FoodController foodController = Get.find();

  MainFoodItemCard({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(23),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 📝 Details Section
              SizedBox(
                width: 156,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title + Rating
                    Row(
                      children: [
                        Text(
                          foodItem.name,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 5),

              Image.asset(
              "assets/icons/Group 359@2x.png"  ,
                height: 8,
              ),

                        const SizedBox(width: 9),
                        Container(
                            height: 10,
                          alignment: Alignment.center,
                          width: 22,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                foodItem.rating.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 6.4),
                              ),
                              const Icon(Icons.star, size: 6, color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    // Equipments + Ingredients
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 92,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: foodItem.equipments.length,
                              itemBuilder: (context, index) {
                                final item = foodItem.equipments[index];
                                return Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/Group 508.svg',

                                      ),
                                      Text(item, style: const TextStyle(fontSize: 5))
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                           ColoredBox(
                            color: colorFromHex("#D6D6D6CE"),
                            child: const SizedBox(width: 1, height: 22),
                          ),
                          SizedBox(width: 12,),
                          SizedBox(
                            height: 40,
                            child: Column(
                              children: [
                                
                                InkWell(
                                  onTap: () async {
                                    Get.toNamed('/details', arguments: foodItem.id);
                                   await foodController.fetchFoodDetails(foodItem.id);

                                  },
                                  child:  Column(
                                    children: [
                                      Text("Ingredients",style: TextStyle(fontSize: 8),)
                                      ,Row(
                                        children: [
                                          Text(
                                            "View List",
                                            style: TextStyle(
                                                color:colorFromHex("#FF8800"), fontSize: 7),
                                          ),
                                          SizedBox(width: 2),
                                          Icon(Icons.arrow_forward_ios,
                                          color:colorFromHex("#FF8800"), size: 7)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Description
                    Text(
                      foodItem.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 10),
                    ),
                  ],
                ),
              ),

              // ➕ Add Button + Image
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 59),
                    height: 80,
                    child: Stack(
                      children: [
                        Container(
                          height: 68,
                          width:92,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(
                              image: NetworkImage(foodItem.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 55,
                          left: 20,
                          child: InkWell(
                            onTap: () {
                              foodController.count.value++;
                            },
                            onDoubleTap: () {
                              foodController.count.value--;
                              if (foodController.count.value == -1) {
                                foodController.count.value = 0;
                              }
                            },
                            child: Container(
                              height: 21,
                              width: 58,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2),
                                border:
                                Border.all(color:colorFromHex("#FF9A26"), width: 0.6),
                              ),
                              child:  Column(
                                children: [
                                  Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: EdgeInsets.all(3.0),
                                            child: Icon(Icons.add,
                                                size: 7, color:colorFromHex("#FF9A26")),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Add',
                                            style: TextStyle(
                                              color:colorFromHex("#FF9A26"),
                                              fontSize: 11,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],

                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(color:  colorFromHex("#D6D6D6CE"),indent: 23
          ,endIndent: 23,)
      ],
    );
  }
}
