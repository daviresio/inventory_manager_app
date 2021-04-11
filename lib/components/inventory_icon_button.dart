import 'package:flutter/material.dart';
import 'package:inventory_manager/core/inventory_radius.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';

class InventoryIconButton extends StatelessWidget {
  final Icon icon;
  final void Function() onTap;
  const InventoryIconButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: InventoryRadius.max.radiusAll(),
        onTap: onTap,
        child: Container(
          padding: InventorySpacing.small1.spacingAll(),
          child: icon,
        ),
      ),
    );
  }
}
