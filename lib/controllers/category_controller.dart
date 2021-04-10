import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory_manager/models/category/category_model.dart';
import 'package:inventory_manager/services/category_service.dart';
import 'package:uuid/uuid.dart';

final categoriesNotifierProvider =
    StateNotifierProvider<CategoriesNotifier>((ref) {
  return CategoriesNotifier(ref.read);
});

final categoryNotifierProvider = StateNotifierProvider<CategoryNotifier>((ref) {
  return CategoryNotifier(ref.read);
});

class CategoriesNotifier extends StateNotifier<CategoryList> {
  final Reader read;
  CategoriesNotifier(this.read, [CategoryList? categoryList])
      : super(categoryList ?? CategoryList.loading());

  getList() async {
    var result = await CategoryService.listCategories();
    if (result != null) {
      state = CategoryList.data(result);
    }
  }
}

class CategoryNotifier extends StateNotifier<Category> {
  final Reader read;
  CategoryNotifier(this.read, [Category? category])
      : super(category ??
            Category.data(CategoryModel(
              name: '',
              valueType: '',
              value: '',
              id: Uuid().v4(),
            )));

  setName(String value) {
    state.maybeWhen(
      data: (data) {
        state = Category.data(data.copyWith(name: value));
      },
      orElse: () {},
    );
  }

  setType(String type) {
    state.maybeWhen(
      data: (data) {
        state = Category.data(data.copyWith(valueType: type));
      },
      orElse: () {},
    );
  }

  save(BuildContext context) async {
    await state.maybeWhen(
      data: (data) async {
        state = Category.loading();
        state = await CategoryService.createCategory(payload: data);
        state = Category.data(data);
        Navigator.of(context).pop(data);
      },
      orElse: () {},
    );
  }
}
