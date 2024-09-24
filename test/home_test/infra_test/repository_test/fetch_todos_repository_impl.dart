import 'package:challenge/home/domain/entity/todo_model.dart';
import 'package:challenge/home/infra/datasource/home_todo_remote_datasource.dart';
import 'package:challenge/home/infra/repository/home_todo_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeToDoRemoteDatasource extends Mock
    implements HomeToDoRemoteDatasource {}

void main() {
  late MockHomeToDoRemoteDatasource mockDatasource;
  late HomeToDoRepositoryImpl repository;

  setUp(() {
    mockDatasource = MockHomeToDoRemoteDatasource();
    repository = HomeToDoRepositoryImpl(mockDatasource);
  });

  test('fetchToDos returns a list of ToDos when datasource fetch is successful',
      () async {
    final now = DateTime.now();
    final toDo = ToDo(
      id: '1',
      name: 'Test ToDo',
      createdAt: now,
      updatedAt: now,
      done: false,
    );

    final jsonList = [
      {
        'id': '1',
        'name': 'Test ToDo',
        'createdAt': now.toIso8601String(),
        'updatedAt': now.toIso8601String(),
        'done': false,
      }
    ];

    when(() => mockDatasource.fetchToDos()).thenAnswer((_) async => jsonList);

    final result = await repository.fetchToDos();

    // Use a custom comparison for DateTime
    expect(result.length, 1);
    expect(result[0].id, toDo.id);
    expect(result[0].name, toDo.name);
    expect(result[0].done, toDo.done);
    // You can compare DateTime separately or adjust as needed
    expect(result[0].createdAt.isAtSameMomentAs(toDo.createdAt), isTrue);
    expect(result[0].updatedAt.isAtSameMomentAs(toDo.updatedAt), isTrue);
    verify(() => mockDatasource.fetchToDos()).called(1);
  });
}
