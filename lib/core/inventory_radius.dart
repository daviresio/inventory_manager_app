import 'package:flutter/material.dart';

class InventoryRadius {
  static const tiny = 2.0;
  static const small = 4.0;
  static const medium = 6.0;
}

extension InventoryRadiusExtension on double {
  BorderRadius radiusAll() => BorderRadius.circular(this);
}
