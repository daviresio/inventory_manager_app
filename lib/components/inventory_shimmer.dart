import 'package:flutter/cupertino.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:shimmer/shimmer.dart';

class InventoryShimmer extends StatelessWidget {
  final Widget? child;

  const InventoryShimmer({this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: InventoryColors.lightGrey,
      highlightColor: InventoryColors.lightGrey.withOpacity(0.3),
      child: child ??
          Container(
            color: InventoryColors.white,
          ),
    );
  }
}
