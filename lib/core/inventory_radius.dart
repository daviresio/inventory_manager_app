import 'package:flutter/material.dart';

class InventoryRadius {
  static const none = 0.0;

  static const tiny = 2.0;
  static const small = 4.0;
  static const medium = 6.0;
  static const large = 8.0;
  static const extraLarge = 10.0;
  static const big = 12.0;
  static const max = 1000.0;
}

extension InventoryRadiusExtension on double {
  BorderRadius radiusAll() => BorderRadius.circular(this);
}
