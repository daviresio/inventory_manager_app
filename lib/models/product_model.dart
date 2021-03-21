import 'dart:convert';

class ProductModel {
  String id;
  String name;
  int amount;
  String image;
  String barcode;

  ProductModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.image,
    required this.barcode,
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
      amount: map['amount'],
      image: map['image'],
      barcode: map['barcode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
