import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlConfig {
  static final String _token =
      'Ion6I7V0YnKeAUOj9qsZuJ2Vkm62r1Zb3vAL6sP4nYHruLgsU4bnqTKprjKL6LXJ';
  // static final AuthLink authLink = AuthLink(getToken: () => _token);

  static final _httpLink = HttpLink(
    'https://inventory-manager.hasura.app/v1/graphql',
    defaultHeaders: <String, String>{
      'x-hasura-admin-secret': _token,
    },
  );

  static final _wsLink = WebSocketLink(
    'wss://inventory-manager.hasura.app/v1/graphql',
    config: SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
      initialPayload: () async {
        return {
          'headers': {
            'x-hasura-admin-secret': _token,
          }
        };
      },
    ),
  );

  // static final Link link = authLink.concat(_httpLink).concat(_wsLink);

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

  static final _wsClient = GraphQLClient(
    link: _wsLink,
    cache: GraphQLCache(store: InMemoryStore()),
    defaultPolicies: DefaultPolicies(
      query: _policies,
      watchQuery: _policies,
      mutate: _policies,
    ),
  );

  static Future<QueryResult> request({required QueryOptions options}) async {
    final result = await _client.query(options).timeout(
          const Duration(seconds: 15),
          onTimeout: () => throw Exception('Timeout error'),
        );

    return result;
  }

  static Stream<QueryResult> subscription(
      {required SubscriptionOptions options}) {
    return _wsClient.subscribe(options);
  }
}















// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// class GraphqlConfig {
//   static final _url = 'https://inventory-manager.hasura.app/v1/graphql';

//   static final HttpLink httpLink = HttpLink(
//     _url,
//   );

//   static String? _token;
//   static final AuthLink authLink = AuthLink(getToken: () => _token!);
//   static final WebSocketLink webSocketLink = WebSocketLink(
//     _url,
//     config: SocketClientConfig(
//       autoReconnect: true,
//       inactivityTimeout: Duration(seconds: 30),
//       initialPayload: () async {
//         return {
//           'headers': {'Authorization': 'Bearer $_token'},
//         };
//       },
//     ),
//   );

//   static final Link link = authLink.concat(httpLink).concat(webSocketLink);
//   static String? token;

//   static ValueNotifier<GraphQLClient> initializeClient(String token) {
//     _token = token;
//     ValueNotifier<GraphQLClient> client = ValueNotifier(
//       GraphQLClient(
//         link: link,
//         cache: GraphQLCache(store: HiveStore()),
//       ),
//     );
//     return client;
//   }
// }
