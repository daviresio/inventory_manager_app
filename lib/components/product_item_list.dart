import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_manager/components/inventory_network_image.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_radius.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';
import 'package:inventory_manager/core/inventory_extensions.dart';
import 'package:inventory_manager/models/product_model.dart';

class ProductItemList extends StatelessWidget {
  final ProductModel product;

  const ProductItemList(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Text(product.barcode ?? '').smallBold(),
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
    );
  }
}
