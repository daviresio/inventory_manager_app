import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory_manager/components/input_row.dart';
import 'package:inventory_manager/components/inventory_divider.dart';
import 'package:inventory_manager/components/inventory_float_action_button.dart';
import 'package:inventory_manager/components/inventory_network_image.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_icons.dart';
import 'package:inventory_manager/core/inventory_radius.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';
import 'package:inventory_manager/core/inventory_extensions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_manager/models/product/product_model.dart';
import 'package:inventory_manager/controllers/add_product_controller.dart';
import 'package:inventory_manager/screens/categories_page.dart';
import 'package:inventory_manager/services/product_service.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AddProductPage extends HookWidget {
  final String? id;

  AddProductPage({this.id});

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final nameCtl = useTextEditingController();
    final barcodeCtl = useTextEditingController();
    final productState = useProvider(productProvider);

    useEffect(() {
      Future.microtask(
        () => context.read(productNotifierProvider).getProduct(id: id),
      );
    }, const []);

    Future<void> _showManualBarcodeDialog() async {
      await showCupertinoDialog(
        context: context,
        builder: (context) {
          var controller = TextEditingController(
            text: productState.maybeWhen(
              data: (data) => data.barcode,
              orElse: () => '',
            ),
          );
          return CupertinoAlertDialog(
            title: Text('Manual input'),
            actions: [
              CupertinoButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: InventoryColors.red,
                  ),
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  context
                      .read(productNotifierProvider)
                      .setBarcode(controller.value.text);
                  barcodeCtl.text = controller.value.text;
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Text('Please input barcode numbers.'),
              Container(
                margin: EdgeInsets.only(top: InventorySpacing.medium2),
                child: CupertinoTextField(
                  controller: controller,
                  decoration: BoxDecoration(
                    color: InventoryColors.transparent,
                    border: Border(
                      bottom: BorderSide(color: InventoryColors.primaryColor),
                    ),
                  ),
                ),
              ),
            ]),
          );
        },
      );
    }

    Widget _image(ProductModel product) {
      if (nameCtl.text.isEmpty && product.name.isNotEmpty) {
        nameCtl.text = product.name;
        barcodeCtl.text = product.barcode ?? '';
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
                  child: Text('Open gallery'),
                ),
                CupertinoActionSheetAction(
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
                  child: Text('Take photo'),
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: InventoryColors.red),
                ),
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
                controller: barcodeCtl,
                onTap: () async {
                  var result = await showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      message: Text('Barcode input method'),
                      actions: [
                        CupertinoActionSheetAction(
                          onPressed: () async {
                            Navigator.of(context).pop();
                          },
                          child: Text('Scan input'),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () async {
                            Navigator.of(context).pop('manual');
                          },
                          child: Text('Manual input'),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () async {
                            Navigator.of(context).pop();
                          },
                          child: Text('Generate barcode'),
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: InventoryColors.red),
                        ),
                      ),
                    ),
                  );
                  if (result != null && result == 'manual') {
                    await _showManualBarcodeDialog();
                  }
                },
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
                      onPressed: () async {
                        await showCupertinoModalBottomSheet(
                          context: context,
                          isDismissible: true,
                          builder: (context) => CategoriesPage(),
                        );
                      },
                      child: Text(
                        'Customize',
                        style: TextStyle(color: InventoryColors.primaryColor),
                      ),
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
                        .tiny(),
                    Text('ex: Brand, manufacture, type, etc.').tiny(),
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButton: InventoryFloatActionButton(
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
          label: 'Save',
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
