import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// GraphQLClient 초기화 유틸리티 클래스
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
