import 'package:flutter/material.dart';
import 'package:inventory_manager/core/inventory_colors.dart';

class InventoryUI {
  static AppBar appBar({@required String title, List<Widget> actions}) {
    return AppBar(
      title: Text(
        title,
      ),
      actions: actions,
      backgroundColor: InventoryColor.white,
    );
  }
}
