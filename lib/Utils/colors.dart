import 'dart:ui';

Color colorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    // Add full opacity if not provided
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix: 16));
}