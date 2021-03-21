import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlClient {
  static final _httpLink = HttpLink(
    'https://inventory-manager.hasura.app/v1/graphql',
    defaultHeaders: <String, String>{
      'x-hasura-admin-secret':
          'Ion6I7V0YnKeAUOj9qsZuJ2Vkm62r1Zb3vAL6sP4nYHruLgsU4bnqTKprjKL6LXJ',
    },
  );

  static final _policies = Policies(
    fetch: FetchPolicy.networkOnly,
  );

  static final _client = GraphQLClient(
    link: _httpLink,
    cache: GraphQLCache(store: InMemoryStore()),
    defaultPolicies: DefaultPolicies(
      query: _policies,
      watchQuery: _policies,
      mutate: _policies,
    ),
  );

  static Future<QueryResult> request({required QueryOptions options}) async {
    final QueryResult result = await _client.query(options).timeout(
          const Duration(seconds: 15),
          onTimeout: () => throw Exception('Timeout error'),
        );

    return result;
  }
}
