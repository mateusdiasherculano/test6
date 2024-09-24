// external/data_sources/to_do_remote_data_source.dart
import 'package:challenge/home/infra/datasource/home_todo_remote_datasource.dart';
import 'package:graphql/client.dart';

class ToDoRemoteDataSource implements HomeToDoRemoteDatasource {
  ToDoRemoteDataSource(this.client);
  final GraphQLClient client;

  @override
  Future<List<Map<String, dynamic>>> fetchToDos() async {
    const query = '''
    query {
      toDos {
        createdAt
        done
        id
        updatedAt
        name
      }
    }
    ''';

    final options = QueryOptions(
      document: gql(query),
      fetchPolicy: FetchPolicy.networkOnly,
    );

    final result = await client.query(options);

    if (result.hasException) {
      throw result.exception!;
    }

    return List<Map<String, dynamic>>.from(result.data!['toDos'] as Iterable);
  }
}
