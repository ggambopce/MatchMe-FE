import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  static Future<ValueNotifier<GraphQLClient>> initClient() async {
    await initHiveForFlutter();

    final HttpLink httpLink = HttpLink("http://localhost:7070/graphql");

    final client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
    );

    return ValueNotifier(client);
  }
}
