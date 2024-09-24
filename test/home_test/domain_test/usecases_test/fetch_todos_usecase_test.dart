import 'package:challenge/home/domain/entity/todo_model.dart';
import 'package:challenge/home/domain/repository/home_todo_repository.dart';
import 'package:challenge/home/domain/usecase/home_todo_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock class
class MockHomeToDoRepository extends Mock implements HomeToDoRepository {}

void main() {
  late MockHomeToDoRepository mockHomeToDoRepository;
  late FetchToDosUseCase fetchToDosUseCase;

  setUp(() {
    mockHomeToDoRepository = MockHomeToDoRepository();
    fetchToDosUseCase = FetchToDosUseCase(mockHomeToDoRepository);
  });

  test('call returns a list of ToDos when repository fetch is successful',
      () async {
    final toDo = ToDo(
      id: '1',
      name: 'Test ToDo',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      done: false,
    );

    when(() => mockHomeToDoRepository.fetchToDos())
        .thenAnswer((_) async => [toDo]);

    final result = await fetchToDosUseCase.call();

    expect(result, [toDo]);
    verify(() => mockHomeToDoRepository.fetchToDos()).called(1);
  });

  test('call throws an exception when repository fetch fails', () async {
    when(() => mockHomeToDoRepository.fetchToDos())
        .thenThrow(Exception('Error'));

    expect(() => fetchToDosUseCase.call(), throwsA(isA<Exception>()));
    verify(() => mockHomeToDoRepository.fetchToDos()).called(1);
  });
}
