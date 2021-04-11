import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_manager/components/inventory_ink_well.dart';
import 'package:inventory_manager/components/inventory_network_image.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_radius.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';
import 'package:inventory_manager/core/inventory_extensions.dart';
import 'package:inventory_manager/models/product/product_model.dart';

class ProductItemList extends StatelessWidget {
  final ProductModel product;
  final void Function() onTap;

  const ProductItemList({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InventoryInkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: InventorySpacing.small1,
          horizontal: InventorySpacing.medium2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InventoryNetworkImage(
                  url: product.image,
                  width: 48,
                  height: 48,
                  radius: InventoryRadius.medium,
                ),
                SizedBox(width: InventorySpacing.medium1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.name).mediumRegular(),
                    SizedBox(height: InventorySpacing.tiny2),
                    Text(product.barcode ?? '').tinyBold(),
                  ],
                ),
              ],
            ),
            Container(
              child: Text(product.amount.toString())
                  .mediumBold(color: InventoryColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
