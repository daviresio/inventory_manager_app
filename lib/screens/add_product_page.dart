import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_manager/components/input_row.dart';
import 'package:inventory_manager/components/inventory_divider.dart';
import 'package:inventory_manager/components/inventory_network_image.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_icons.dart';
import 'package:inventory_manager/core/inventory_radius.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';
import 'package:inventory_manager/core/inventory_extensions.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatelessWidget {
  final picker = ImagePicker();

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
                  onPressed: () async {
                    var result =
                        await picker.getImage(source: ImageSource.gallery);
                    if (result != null) {
                      print(result);
                    }
                  },
                ),
                CupertinoActionSheetAction(
                  child: Text('Take photo'),
                  onPressed: () async {
                    var result =
                        await picker.getImage(source: ImageSource.camera);
                    if (result != null) {
                      print(result);
                    }
                  },
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
      backgroundColor: InventoryColors.white,
      body: CustomScrollView(
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
            child: InputRow(
              label: 'Barcode',
              placeholder: 'Select barcode input method',
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: InventoryDivider.horizontal(
              margin: EdgeInsets.symmetric(horizontal: InventorySpacing.small3),
              height: 0.2,
              color: InventoryColors.darkColor.withOpacity(0.3),
            ),
          ),
          SliverToBoxAdapter(
            child: InputRow(
              label: 'Product',
              placeholder: 'Input product name.',
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 8,
              color: InventoryColors.lightGrey,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: InventorySpacing.small3.spacingAll(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text('Categories').mediumBold(),
                      SizedBox(width: InventorySpacing.tiny3),
                      Icon(
                        InventoryIcons.circle_question,
                        size: 16,
                        color: InventoryColors.darkColor,
                      ),
                    ],
                  ),
                  TextButton(
                    child: Text(
                      'Customize',
                      style: TextStyle(color: InventoryColors.primaryColor),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: InventorySpacing.medium3.spacingAll(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Add product categories for convenient management.')
                      .small(),
                  Text('ex: Brand, manufacture, type, etc.').small(),
                ],
              ),
            ),
          )
        ],
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
