import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Utility {
  static Utility utility = null;

  static Utility getInstance() {
    if (utility == null) {
      utility = Utility();
    }
    return utility;
  }

  static showAlertDialogTest(){
    print('showAlertDialogTest');
  }

}

class ConvertHexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  ConvertHexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
