import 'package:flutter/material.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_radius.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';
import 'package:inventory_manager/core/inventory_extensions.dart';

class InventoryCard extends StatelessWidget {
  final String title;
  final Widget child;

  const InventoryCard({@required this.child, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: InventorySpacing.small2.spacingAll(),
      decoration: BoxDecoration(
          color: InventoryColor.white,
          borderRadius: InventoryRadius.small.radiusAll(),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.black12,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Container(
              margin: EdgeInsets.only(bottom: InventorySpacing.small2),
              child: Text(title).mediumBold(),
            ),
          child,
        ],
      ),
    );
  }
}
