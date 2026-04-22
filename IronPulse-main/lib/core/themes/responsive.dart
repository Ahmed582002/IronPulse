import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  double wp(double percent) => screenWidth * percent;
  double hp(double percent) => screenHeight * percent;
}
