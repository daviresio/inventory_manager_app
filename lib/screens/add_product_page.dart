import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_manager/components/inventory_network_image.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_icons.dart';
import 'package:inventory_manager/core/inventory_radius.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';
import 'package:inventory_manager/core/inventory_extensions.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AddProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _image() {
      var imageSize = 80.0;
      return GestureDetector(
        onTap: () async {
          await showCupertinoModalPopup(
            context: context,
            builder: (context) => CupertinoActionSheet(
              message: Text('Select product image'),
              actions: [
                CupertinoActionSheetAction(
                  child: Text('Open gallery'),
                  onPressed: () {},
                ),
                CupertinoActionSheetAction(
                  child: Text('Take photo'),
                  onPressed: () {},
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(left: 10),
          width: imageSize + 10,
          height: imageSize,
          child: Stack(
            children: [
              InventoryNetworkImage(
                url: null,
                width: imageSize,
                height: imageSize,
                radius: InventoryRadius.medium,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: InventorySpacing.tiny2.spacingAll(),
                  decoration: BoxDecoration(
                    color: InventoryColors.primaryColor,
                    borderRadius: InventoryRadius.max.radiusAll(),
                    border: Border.all(color: InventoryColors.white, width: 2),
                  ),
                  child: Icon(
                    InventoryIcons.camera,
                    color: InventoryColors.white,
                    size: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        child: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: InventorySpacing.small3.spacingAll(),
                margin: EdgeInsets.only(
                  bottom: InventorySpacing.small3,
                ),
                child: Center(
                  child: Text('Add product').mediumBold(),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: InventorySpacing.medium3),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: _image(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: InventorySpacing.medium2),
                      child: Text('Product').mediumRegular(),
                    ),
                    Flexible(
                      child: CupertinoTextField(
                        placeholder: 'Input product name.',
                      ),
                    ),
                    Icon(InventoryIcons.angle_right),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        margin: InventorySpacing.medium2.spacingHorizontal(),
        child: CupertinoButton(
          child: Text('Save'),
          color: InventoryColors.primaryColor,
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
