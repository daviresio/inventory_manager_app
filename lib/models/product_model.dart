import 'dart:convert';

class ProductModel {
  String? id;
  String name;
  int amount;
  String? image;
  String? barcode;

  ProductModel({
    this.id,
    required this.name,
    required this.amount,
    this.image,
    this.barcode,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'image': image,
      'barcode': barcode,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      amount: map['amount'] ?? 0,
      image: map['image'],
      barcode: map['barcode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  ProductModel copyWith({
    String? id,
    String? name,
    int? amount,
    String? image,
    String? barcode,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      image: image ?? this.image,
      barcode: barcode ?? this.barcode,
    );
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, amount: $amount, image: $image, barcode: $barcode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.amount == amount &&
        other.image == image &&
        other.barcode == barcode;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        amount.hashCode ^
        image.hashCode ^
        barcode.hashCode;
  }
}
