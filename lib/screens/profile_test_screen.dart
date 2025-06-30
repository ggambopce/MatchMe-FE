import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String getProfilesQuery = r'''
  query {
    getAllProfiles {
      id
      nickname
      mbti
    }
  }
''';

class ProfileTestScreen extends StatelessWidget {
  const ProfileTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GraphQL 테스트")),
      body: Query(
        options: QueryOptions(document: gql(getProfilesQuery)),
        builder: (result, {fetchMore, refetch}) {
          if (result.isLoading)
            return const Center(child: CircularProgressIndicator());
          if (result.hasException) return Text(result.exception.toString());

          final profiles = result.data!['getAllProfiles'];

          return ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              final profile = profiles[index];
              return ListTile(
                title: Text(profile['nickname']),
                subtitle: Text(profile['mbti']),
              );
            },
          );
        },
      ),
    );
  }
}
