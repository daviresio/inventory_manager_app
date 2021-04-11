import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:inventory_manager/components/inventory_network_image.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_icons.dart';
import 'package:inventory_manager/core/inventory_radius.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';
import 'package:inventory_manager/core/inventory_extensions.dart';

class ViewProductScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: InventoryColors.lightGrey,
        appBar: CupertinoNavigationBar(
          middle: Text('Details'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(
                  InventoryIcons.edit,
                  color: InventoryColors.darkColor,
                  size: 18,
                ),
              ),
              SizedBox(width: InventorySpacing.small3),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  InventoryIcons.ellipsis_stroke_vertical,
                  color: InventoryColors.darkColor,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                color: InventoryColors.white,
                padding: InventorySpacing.medium1.spacingAll(),
                child: Row(
                  children: [
                    InventoryNetworkImage(
                      url: '',
                      width: 80,
                      height: 80,
                      radius: InventoryRadius.medium,
                    ),
                    SizedBox(width: InventorySpacing.medium1),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: InventorySpacing.tiny1,
                                horizontal: InventorySpacing.tiny1,
                              ),
                              decoration: BoxDecoration(
                                color: InventoryColors.primaryColor
                                    .withOpacity(0.1),
                                borderRadius: InventoryRadius.tiny.radiusAll(),
                              ),
                              child: Text('1234567891234').tiny(
                                color: InventoryColors.primaryColor,
                              ),
                            ),
                            SizedBox(height: InventorySpacing.tiny1),
                            Text('Produto um').smallBold(),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
