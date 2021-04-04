import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:inventory_manager/core/error_handler.dart';
import 'package:inventory_manager/models/product_model.dart';
import 'package:inventory_manager/services/graphql_client_service.dart';

class ProductService {
  static Future<bool> createProduct({required ProductModel payload}) async {
    String query = '''
      mutation CreateProduct(\$product: product_insert_input!) {
        insert_product(objects: [\$product]) {
          affected_rows
        }
      }
    ''';

    try {
      final options = QueryOptions(
        document: gql(query),
        variables: <String, dynamic>{
          'product': payload.toJson(),
        },
      );
      final result = await GraphqlClient.request(options: options);

      if (result.hasException) throw result.exception!;

      return true;
    } catch (e, s) {
      InventoryError.recordError(e, s);
      return false;
    }
  }

  static Stream<List<ProductModel>>? watchProducts() {
    String query = '''
      subscription WatchProducts {
        product(order_by: {updated_at: desc}) {
          id
          name
          image
          barcode
        }
      }
    ''';

    try {
      final options = SubscriptionOptions(
        document: gql(query),
      );
      final result = GraphqlClient.subscription(options: options);
      return result.map((event) {
        var responseJson = event.data!['product'];
        var data =
            responseJson.map((element) => ProductModel.fromJson(element));

        return List<ProductModel>.from(data);
      });
    } catch (e, s) {
      InventoryError.recordError(e, s);
      return null;
    }
  }

  static Future<ProductModel?> getProduct({required String id}) async {
    String query = '''
      query GetProduct(\$id: uuid!) {
        product_by_pk(id: \$id) {
          id
          name
          amount
          image
          barcode
        }
      }
    ''';

    try {
      final options = QueryOptions(
        document: gql(query),
        variables: {
          'id': id,
        },
      );
      final result = await GraphqlClient.request(options: options);

      if (result.hasException) throw result.exception!;

      var responseJson = result.data!['product_by_pk'];

      return ProductModel.fromJson(responseJson);
    } catch (e, s) {
      InventoryError.recordError(e, s);
      return null;
    }
  }
}
