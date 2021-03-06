import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_manager/components/product_item_list.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_icons.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';
import 'package:inventory_manager/models/product/product_model.dart';
import 'package:inventory_manager/screens/add_product_page.dart';
import 'package:inventory_manager/screens/view_product_screen.dart';
import 'package:inventory_manager/services/product_service.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProductModel>>(
        stream: ProductService.watchProducts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              color: InventoryColors.white,
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }
          var products = snapshot.data;
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
                        onTap: () {},
                        child: Icon(
                          InventoryIcons.layer_group,
                          color: InventoryColors.darkColor,
                          size: 18,
                        ),
                      ),
                      SizedBox(width: InventorySpacing.small3),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          InventoryIcons.in_out,
                          color: InventoryColors.darkColor,
                          size: 18,
                        ),
                      ),
                      SizedBox(width: InventorySpacing.small3),
                      GestureDetector(
                        onTap: () async {
                          await showCupertinoModalBottomSheet(
                            context: context,
                            isDismissible: true,
                            builder: (context) => AddProductPage(),
                          );
                        },
                        child: Icon(
                          InventoryIcons.plus,
                          color: InventoryColors.darkColor,
                          size: 18,
                        ),
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
                            placeholder:
                                'Search a product name, barcode, category',
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: InventorySpacing.small3),
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
                    products!
                        .map(
                          (e) => ProductItemList(
                            product: e,
                            onTap: () => showCupertinoModalBottomSheet(
                              context: context,
                              isDismissible: true,
                              builder: (context) => ViewProductScreen(),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
