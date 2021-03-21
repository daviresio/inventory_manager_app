import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:inventory_manager/components/inventory_shimmer.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_radius.dart';

class InventoryNetworkImage extends StatelessWidget {
  final String? url;
  final double width;
  final double height;
  final double radius;

  const InventoryNetworkImage({
    required this.url,
    required this.width,
    required this.height,
    this.radius = InventoryRadius.none,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius.radiusAll(),
      child: CachedNetworkImage(
        imageUrl: url ?? '',
        width: width,
        height: height,
        fit: BoxFit.cover,
        placeholder: (context, url) => InventoryShimmer(),
        errorWidget: (context, url, error) => Container(
          width: width,
          height: height,
          color: InventoryColors.lightGrey,
        ),
      ),
    );
  }
}
