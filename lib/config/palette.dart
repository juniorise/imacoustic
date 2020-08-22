import 'dart:ui';
export 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Palette {
  static Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };

  //0xAARRGGBB
  static MaterialColor appbar = MaterialColor(0xFF172634, color);
  //Color.fromRGBO(23, 38, 52, 100),
  static MaterialColor background = MaterialColor(0xFF161f28, color);
  //Color.fromRGBO(22, 31, 40, 100),

  static const Color red = Color(0xFFef6177);
  //Color.fromRGBO(239, 98, 119, 100),
  static const Color sky = Color(0xFF64b7f7);
  //Color.fromRGBO(100, 183, 247, 100),
  static const Color green = Color(0xFF4fa872);
  //Color.fromRGBO(79, 168, 114, 100),
  static const Color yellow = Color(0xFFf1c933);
  //Color.fromRGBO(241, 201, 51, 100),
  static const Color purple = Color(0xFF6b48fa);
  //Color.fromRGBO(107, 71, 250, 100),
  static const Color text = Color(0xFFb9bec2);
  //Color.fromRGBO(185, 190, 194, 100) //(255, 255, 255, 0.7)
  static const Color icon = Color(0xFF223343);
  //Color.fromRGBO(34, 33, 43, 100),
  static const Color appbar65 = Color.fromRGBO(23, 38, 52, .65);

  static const LinearGradient greenblue = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color.fromRGBO(79, 168, 114, 100),
      Color.fromRGBO(100, 183, 247, 100)
    ],
  );
}
