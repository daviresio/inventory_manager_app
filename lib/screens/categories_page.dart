import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory_manager/controllers/category_controller.dart';
import 'package:inventory_manager/core/inventory_colors.dart';
import 'package:inventory_manager/core/inventory_icons.dart';
import 'package:inventory_manager/core/inventory_spacing.dart';
import 'package:inventory_manager/models/category/category_model.dart';
import 'package:inventory_manager/screens/add_category_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CategoriesPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var categoryState = useProvider(categoriesNotifierProvider.state);

    useEffect(() {
      Future.microtask(
        () => context.read(categoriesNotifierProvider).getList(),
      );
    }, const []);

    Widget _item({required CategoryModel category, bool isSelected = false}) {
      return ListTile(
        title: Text(category.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(category.valueType ?? ''),
            SizedBox(width: InventorySpacing.small1),
            Icon(InventoryIcons.bell),
          ],
        ),
      );
    }

    Widget _body(List<CategoryModel> categories) {
      return Material(
        color: Colors.transparent,
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Product Category'),
            trailing: InkWell(
              onTap: () async {
                await showCupertinoModalBottomSheet(
                  context: context,
                  isDismissible: true,
                  builder: (context) => AddCategoryPage(),
                );
              },
              child: Text('Add'),
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  categories
                      .map((e) => _item(category: e, isSelected: false))
                      .toList(),
                ),
              ),
            ],
          ),
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
