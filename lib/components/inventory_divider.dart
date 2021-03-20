import 'package:flutter/widgets.dart';
import 'package:inventory_manager/core/inventory_colors.dart';

class InventoryDivider {
  static Widget horizontal() {
    return Container();
  }

  static Widget vertical({
    color = InventoryColor.darkColor,
    double width = 1,
    double padding = 0,
    EdgeInsets margin = EdgeInsets.zero,
  }) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: padding),
      margin: margin,
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}
