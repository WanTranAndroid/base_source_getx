import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    String color = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      color = "FF" + color;
    }
    return int.parse(color, radix: 16);
  }

  HexColor(String hexColor) : super(_getColorFromHex(hexColor));
}
