import 'package:challenge/actions/add_todo/domain/usecase/add_todo_usecase.dart';
import 'package:challenge/actions/add_todo/presenter/add_todo_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock class for AddToDoUseCase
class MockAddToDoUseCase extends Mock implements AddToDoUseCase {}

void main() {
  late AddToDoCubit addToDoCubit;
  late MockAddToDoUseCase mockAddToDoUseCase;

  setUp(() {
    mockAddToDoUseCase = MockAddToDoUseCase();
    addToDoCubit = AddToDoCubit(mockAddToDoUseCase);
  });

  tearDown(() {
    addToDoCubit.close();
  });

  test('calls execute on AddToDoUseCase when addToDo is called', () async {
    // Arrange
    const id = '123';
    const name = 'Test Task';
    const createdAt = '2024-08-14T12:00:00';
    const updatedAt = '2024-08-14T12:00:00';
    const done = false;

    when(() => mockAddToDoUseCase.execute(
          id: id,
          name: name,
          createdAt: createdAt,
          updatedAt: updatedAt,
          done: done,
        )).thenAnswer((_) async {});

    // Act
    await addToDoCubit.addToDo(
      id: id,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
      done: done,
    );

    // Assert
    verify(
      () => mockAddToDoUseCase.execute(
        id: id,
        name: name,
        createdAt: createdAt,
        updatedAt: updatedAt,
        done: done,
      ),
    ).called(1);
  });
}
