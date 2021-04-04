import 'package:flutter/material.dart';

class InventorySpacing {
  static const tiny1 = 2.0;
  static const tiny2 = 4.0;
  static const tiny3 = 6.0;

  static const small1 = 10.0;
  static const small2 = 12.0;
  static const small3 = 14.0;

  static const medium1 = 16.0;
  static const medium2 = 20.0;
  static const medium3 = 24.0;

  static const big1 = 30.0;
  static const big2 = 40.0;
  static const big3 = 50.0;
}

extension InventorySpacingExtension on double {
  EdgeInsets spacingAll() {
    return EdgeInsets.all(this);
  }

  EdgeInsets spacingVertical() {
    return EdgeInsets.symmetric(vertical: this);
  }

  EdgeInsets spacingHorizontal() {
    return EdgeInsets.symmetric(horizontal: this);
  }
}

extension InventoryEdgeInsetsExtension on EdgeInsets {
  and({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return this.copyWith(
      left: left ?? this.left,
      top: top ?? this.top,
      right: right ?? this.right,
      bottom: bottom ?? this.bottom,
    );
  }
}
