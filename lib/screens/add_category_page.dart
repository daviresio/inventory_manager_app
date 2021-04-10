import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory_manager/components/input_row.dart';
import 'package:inventory_manager/components/inventory_float_action_button.dart';
import 'package:inventory_manager/controllers/category_controller.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/models/category/category_model.dart';
import 'package:strings/strings.dart';

class AddCategoryPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var categoryState = useProvider(categoryNotifierProvider.state);
    var nameController = useTextEditingController();
    var valueTypeController = useTextEditingController();

    Widget _body(CategoryModel category) {
      return Material(
        child: Scaffold(
          appBar: CupertinoNavigationBar(
            middle: Text('New category'),
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: InputRow(
                  label: 'Name',
                  placeholder: 'Input category name.',
                  controller: nameController,
                  onChanged: (value) {
                    context.read(categoryNotifierProvider).setName(value);
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: InputRow(
                  label: 'Type',
                  placeholder: 'Select category type.',
                  controller: valueTypeController,
                  onTap: () async {
                    var result = await showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                        message: Text('Barcode input method'),
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () async {
                              Navigator.of(context).pop('TEXT');
                            },
                            child: Text('Text'),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () async {
                              Navigator.of(context).pop('NUMBER');
                            },
                            child: Text('Number'),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () async {
                              Navigator.of(context).pop('DATE');
                            },
                            child: Text('Date'),
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

                    if (result != null) {
                      context.read(categoryNotifierProvider).setType(result);
                      valueTypeController.text =
                          capitalize(result.toLowerCase());
                    }
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: InventoryFloatActionButton(
            onPressed: () async {
              await context.read(categoryNotifierProvider).save(context);
            },
            label: 'Save',
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      );
    }

    return categoryState.when(
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
