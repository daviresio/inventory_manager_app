import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:inventory_manager/models/product_model.dart';
import 'package:inventory_manager/services/graphql_client_service.dart';

class ProductService {
  static Future<bool> createProduct({required ProductModel product}) async {
    String query = '''
      mutation CreateProduct($product: product_insert_input!) {
        insert_product(objects: [$product]) {
          affected_rows
        }
      }
    ''';

    try {
      final options = QueryOptions(
        document: gql(query),
        variables: <String, dynamic>{
          'product': product.toJson(),
        },
      );
      final result = await GraphqlClient.request(options: options);

      if (result.hasException) throw result.exception!;

      return true;
    } catch (e, s) {
      return false;
    }
  }

  static Future<List<ProductModel>?> listProducts() async {
    String query = '''
      query ListProducts {
        product {
          id
          name
          image
          barcode
        }
      }
    ''';

    try {
      final options = QueryOptions(
        document: gql(query),
      );
      final result = await GraphqlClient.request(options: options);

      if (result.hasException) throw result.exception!;

      var data = result.data!['product']
          .map((element) => ProductModel.fromJson(element))
          .toList();

      return data;
    } catch (e, s) {
      return null;
    }
  }
}
