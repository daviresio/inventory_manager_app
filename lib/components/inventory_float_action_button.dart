import 'package:flutter/cupertino.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';

class InventoryFloatActionButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const InventoryFloatActionButton(
      {required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: InventorySpacing.medium2.spacingHorizontal(),
      child: CupertinoButton(
        child: Text(label),
        color: InventoryColors.primaryColor,
        onPressed: onPressed,
      ),
    );
  }
}
