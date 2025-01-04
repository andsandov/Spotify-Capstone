import 'package:flutter/material.dart';

class ScreenSizeProvider extends ChangeNotifier {
  double screenWidth = 0;
  double screenHeight = 0;
  double containerWidth = 0;
  double containerHeight = 0;

  static const double aspectRatio = 2 / 3;

  void updateScreenSize(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    final maxHeight = screenHeight;
    final maxWidth = maxHeight * aspectRatio;

    containerWidth = maxWidth > screenWidth ? screenWidth : maxWidth;
    containerHeight = containerWidth / aspectRatio;

    notifyListeners();
  }
}
