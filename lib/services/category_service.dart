import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:inventory_manager/core/error_handler.dart';
import 'package:inventory_manager/models/category/category_model.dart';
import 'package:inventory_manager/services/graphql_client_service.dart';

class CategoryService {
  static Future<Category> createCategory(
      {required CategoryModel payload}) async {
    var query = r'''
      mutation CreateCategory($category: category_insert_input!) {
        insert_category_one(object: $category) {
          id
          name
          value
          value_type
        }
      }
    ''';

    try {
      final options = QueryOptions(
        document: gql(query),
        variables: <String, dynamic>{
          'category': payload.toJson(),
        },
      );
      final result = await GraphqlConfig.request(options: options);

      if (result.hasException) throw result.exception!;

      return Category.data(
        CategoryModel.fromJson(result.data!['insert_category_one']),
      );
    } catch (e, s) {
      InventoryError.recordError(e, s);
      return Category.error(e, s);
    }
  }

  static Future<List<CategoryModel>?> listCategories() async {
    var query = r'''
      query ListCategories {
        category(order_by: {updated_at: desc}) {
          id
          name
          value
          value_type
          created_at
          updated_at
        }
      }
    ''';

    try {
      final options = QueryOptions(document: gql(query));
      final result = await GraphqlConfig.request(options: options);
      var responseJson = result.data!['category'];
      var data = responseJson.map((element) => CategoryModel.fromJson(element));

      return List<CategoryModel>.from(data);
    } catch (e, s) {
      InventoryError.recordError(e, s);
      return null;
    }
  }
}
