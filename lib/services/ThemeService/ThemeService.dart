import 'package:flutter/material.dart';

Image appLogo = new Image(
  image: new ExactAssetImage("assets/images/logo.png"),
  width: 45,
  height: 45,
  fit: BoxFit.contain,
  alignment: FractionalOffset.center,
);

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Color primaryMainColor = HexColor("5A20F0");
Color secondaryMainColor = HexColor("16C85A");
Color primaryBackgroundColor = HexColor("FFFFFF");

Color primaryFontColor = HexColor("FFFFFF");
Color secondaryFontColor = HexColor("000000");

TextStyle headingTextStyle = TextStyle(
  color: primaryMainColor,
  fontWeight: FontWeight.w800,
  fontSize: 20,
);
