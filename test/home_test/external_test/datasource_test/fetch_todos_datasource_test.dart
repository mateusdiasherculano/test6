import 'package:challenge/home/external/datasource/home_todo_remote_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';

class MockGraphQLClient extends Mock implements GraphQLClient {}

void main() {
  late MockGraphQLClient mockClient;
  late ToDoRemoteDataSource dataSource;

  setUp(() {
    mockClient = MockGraphQLClient();
    dataSource = ToDoRemoteDataSource(mockClient);
  });

  test('fetchToDos returns a list of ToDos when the query is successful',
      () async {
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

    final queryOptions = QueryOptions(
      document: gql(query),
      fetchPolicy: FetchPolicy.networkOnly,
    );

    final queryResult = QueryResult(
      source: QueryResultSource.network,
      data: {
        'toDos': [
          {
            'id': '1',
            'name': 'Test ToDo',
            'createdAt': DateTime.now().toIso8601String(),
            'updatedAt': DateTime.now().toIso8601String(),
            'done': false,
          }
        ],
      },
      options: queryOptions,
    );

    when(() => mockClient.query(queryOptions))
        .thenAnswer((_) async => queryResult);

    final result = await dataSource.fetchToDos();

    expect(result, isA<List<Map<String, dynamic>>>());
    expect(result.length, 1);
    expect(result[0]['id'], '1');
    expect(result[0]['name'], 'Test ToDo');
    expect(result[0]['done'], false);
    // Optionally, compare DateTime values if needed
    verify(() => mockClient.query(queryOptions)).called(1);
  });

  test('fetchToDos throws an exception when the query fails', () async {
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

    final queryOptions = QueryOptions(
      document: gql(query),
      fetchPolicy: FetchPolicy.networkOnly,
    );

    final queryException = OperationException(
      graphqlErrors: [const GraphQLError(message: 'Error')],
    );

    when(() => mockClient.query(queryOptions)).thenAnswer(
      (_) async => QueryResult(
        source: QueryResultSource.network,
        exception: queryException,
        options: queryOptions,
      ),
    );

    expect(() => dataSource.fetchToDos(), throwsA(isA<OperationException>()));
    verify(() => mockClient.query(queryOptions)).called(1);
  });
}
