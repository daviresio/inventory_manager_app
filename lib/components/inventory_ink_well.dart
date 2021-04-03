import 'package:flutter/material.dart';
import 'package:inventory_manager/core/inventory_colors.dart';

class InventoryInkWell extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  const InventoryInkWell({required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: InventoryColors.transparent,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
