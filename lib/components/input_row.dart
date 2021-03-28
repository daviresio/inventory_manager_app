import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_icons.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';
import 'package:inventory_manager/core/inventory_extensions.dart';

class InputRow extends StatelessWidget {
  final String label;
  final String placeholder;
  final void Function()? onTap;
  final TextEditingController? controller;

  const InputRow({
    required this.label,
    required this.placeholder,
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    bool isTouch = onTap != null;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: InventorySpacing.small3,
          vertical: InventorySpacing.small1,
        ),
        child: Row(
          children: [
            Text(label).mediumRegular(),
            SizedBox(width: InventorySpacing.medium2),
            Flexible(
              child: CupertinoTextField(
                controller: controller,
                readOnly: isTouch,
                placeholder: placeholder,
                decoration: BoxDecoration(
                  color: InventoryColors.transparent,
                ),
              ),
            ),
            SizedBox(width: InventorySpacing.medium2),
            Icon(
              InventoryIcons.angle_right,
              size: 18,
              color: InventoryColors.darkColor,
            ),
          ],
        ),
      ),
    );
  }
}
