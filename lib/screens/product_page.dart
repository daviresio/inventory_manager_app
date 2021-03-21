import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_manager/components/product_item_list.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_icons.dart';
import 'package:inventory_manager/core/inventory_radius.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';
import 'package:inventory_manager/core/inventory_extensions.dart';
import 'package:inventory_manager/models/product_model.dart';
import 'package:inventory_manager/screens/add_product_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

List<ProductModel> products = [
  ProductModel(
      id: '1',
      name: 'Primeiro produto',
      amount: 4,
      image: '',
      barcode: '1243423'),
  ProductModel(
      id: '1',
      name: 'Segundo produto',
      amount: 10,
      image: '',
      barcode: '1243423'),
  ProductModel(
      id: '1',
      name: 'Terceiro produto',
      amount: 5,
      image: '',
      barcode: '1243423'),
];

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            automaticallyImplyLeading: false,
            largeTitle: Container(
              height: 40,
              padding: EdgeInsets.only(left: InventorySpacing.small1),
              child: Text('Product'),
            ),
            border: null,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(
                    InventoryIcons.layer_group,
                    color: InventoryColors.darkColor,
                    size: 18,
                  ),
                  onTap: () {},
                ),
                SizedBox(width: InventorySpacing.small3),
                GestureDetector(
                  child: Icon(
                    InventoryIcons.in_out,
                    color: InventoryColors.darkColor,
                    size: 18,
                  ),
                  onTap: () {},
                ),
                SizedBox(width: InventorySpacing.small3),
                GestureDetector(
                  child: Icon(
                    InventoryIcons.plus,
                    color: InventoryColors.darkColor,
                    size: 18,
                  ),
                  onTap: () async {
                    await showCupertinoModalBottomSheet(
                      context: context,
                      isDismissible: true,
                      builder: (context) => AddProductPage(),
                    );
                  },
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: InventorySpacing.medium2
                  .spacingHorizontal()
                  .and(bottom: InventorySpacing.small3),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: CupertinoSearchTextField(
                      placeholder: 'Search a product name, barcode, category',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: InventorySpacing.small3),
                    child: Icon(
                      InventoryIcons.barcode_read,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              products.map((e) => ProductItemList(e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
