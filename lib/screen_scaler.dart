import 'package:flutter/material.dart';

class ScreenScaler {
  static late double _shortestSide;

  static void init(BuildContext context) {
    _shortestSide = MediaQuery.of(context).size.shortestSide;
  }

  static double scale(double input) {
    return _shortestSide * (input / 100); // Treat `input` as a percentage of the shortest side
  }
}
