import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory_manager/components/input_row.dart';
import 'package:inventory_manager/components/inventory_divider.dart';
import 'package:inventory_manager/components/inventory_network_image.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_icons.dart';
import 'package:inventory_manager/core/inventory_radius.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';
import 'package:inventory_manager/core/inventory_extensions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_manager/models/product_model.dart';
import 'package:inventory_manager/screens/add_product_controller.dart';
import 'package:inventory_manager/services/product_service.dart';

class AddProductPage extends HookWidget {
  final String? id;

  AddProductPage({this.id});

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final nameCtl = useTextEditingController();
    final productState = useProvider(productProvider);

    useEffect(() {
      Future.microtask(
        () => context.read(productNotifierProvider).getProduct(id: id),
      );
    }, const []);

    Widget _image(ProductModel product) {
      if (nameCtl.text.isEmpty && product.name.isNotEmpty) {
        nameCtl.text = product.name;
      }
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
                      context
                          .read(productNotifierProvider)
                          .setImage(result.path);
                    }
                    Navigator.of(context).pop();
                  },
                ),
                CupertinoActionSheetAction(
                  child: Text('Take photo'),
                  onPressed: () async {
                    var result =
                        await picker.getImage(source: ImageSource.camera);
                    if (result != null) {
                      context
                          .read(productNotifierProvider)
                          .setImage(result.path);
                    }
                    Navigator.of(context).pop();
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
                url: product.image,
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

    Widget _body(ProductModel product) {
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
                  child: _image(product),
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
                margin:
                    EdgeInsets.symmetric(horizontal: InventorySpacing.small3),
                height: 0.2,
                color: InventoryColors.darkColor.withOpacity(0.3),
              ),
            ),
            SliverToBoxAdapter(
              child: InputRow(
                label: 'Product',
                placeholder: 'Input product name.',
                controller: nameCtl,
                onChanged: (String value) {
                  context.read(productNotifierProvider).changeName(value);
                },
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
            onPressed: () async {
              await ProductService.createProduct(
                payload: ProductModel(
                  name: product.name,
                  amount: 0,
                  id: product.id,
                  image: product.image,
                ),
              );

              Navigator.of(context).pop();
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    }

    return productState.when(
      data: (data) => _body(data),
      loading: () => Container(
        color: InventoryColors.white,
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
      error: (_, __) => Container(),
    );
  }
}
