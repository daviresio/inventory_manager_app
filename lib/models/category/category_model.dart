import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory CategoryModel({
    String? id,
    required String name,
    String? value,
    String? valueType,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category.data(CategoryModel category) = CategoryData;
  const factory Category.loading() = CategoryLoading;
  const factory Category.error(Object error, StackTrace stackTrace) =
      CategoryError;
}

@freezed
class CategoryList with _$CategoryList {
  const factory CategoryList.data(List<CategoryModel> categories) =
      CategoryListData;
  const factory CategoryList.loading() = CategoryListLoading;
  const factory CategoryList.error(Object error, StackTrace stackTrace) =
      CategoryListError;
}
