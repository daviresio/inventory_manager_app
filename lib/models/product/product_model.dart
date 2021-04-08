import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

const _uuid = Uuid();

@freezed
class ProductModel with _$ProductModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ProductModel({
    String? id,
    required String name,
    @Default(0) int amount,
    String? image,
    String? barcode,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProductModel;

  factory ProductModel.create() {
    return ProductModel(
      id: _uuid.v4(),
      name: '',
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product.data(ProductModel product) = ProductData;
  const factory Product.loading() = ProductLoading;
  const factory Product.error(Object error, StackTrace stackTrace) =
      ProductError;
}
