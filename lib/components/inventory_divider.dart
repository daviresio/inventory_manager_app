import 'package:flutter/widgets.dart';
import 'package:inventory_manager/core/inventory_colors.dart';

class InventoryDivider {
  static Widget horizontal({
    color = InventoryColors.darkColor,
    double width = double.maxFinite,
    double height = 1,
    double padding = 0,
    EdgeInsets margin = EdgeInsets.zero,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: padding),
      margin: margin,
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }

  static Widget vertical({
    color = InventoryColors.darkColor,
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
