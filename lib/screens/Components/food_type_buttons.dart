import 'package:flutter/material.dart';
import 'package:my_app/Utils/colors.dart';

class FoodTypeButtons extends StatelessWidget {
  final String foodType;
  final bool isSelected;

  const FoodTypeButtons({
    super.key,
    required this.foodType,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 77,
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: isSelected ? colorFromHex("#FFF9F2") : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isSelected ? colorFromHex("#FF941A"): colorFromHex("#BDBDBD"),
        ),
      ),
      child: Center(
        child: Text(
          foodType,
          style: TextStyle(
            color: isSelected ? colorFromHex("#FF941A") : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
