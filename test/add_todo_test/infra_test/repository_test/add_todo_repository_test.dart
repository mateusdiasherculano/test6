import 'package:challenge/actions/add_todo/infra/datasources/add_todo_datasource.dart';
import 'package:challenge/actions/add_todo/infra/repository/add_todo_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock class for AddToDoDatasource
class MockAddToDoDatasource extends Mock implements AddToDoDatasource {}

void main() {
  late AddToDoRepositoryImpl addToDoRepository;
  late MockAddToDoDatasource mockAddToDoDatasource;

  setUp(() {
    mockAddToDoDatasource = MockAddToDoDatasource();
    addToDoRepository = AddToDoRepositoryImpl(mockAddToDoDatasource);
  });

  test('calls addTask on AddToDoDatasource when addTask is called', () async {
    // Arrange
    const id = '123';
    const name = 'Test Task';
    const createdAt = '2024-08-14T12:00:00';
    const updatedAt = '2024-08-14T12:00:00';
    const done = false;

    when(() => mockAddToDoDatasource.addTask(
          id: id,
          name: name,
          createdAt: createdAt,
          updatedAt: updatedAt,
          done: done,
        )).thenAnswer((_) async {});

    // Act
    await addToDoRepository.addTask(
      id: id,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
      done: done,
    );

    // Assert
    verify(() => mockAddToDoDatasource.addTask(
          id: id,
          name: name,
          createdAt: createdAt,
          updatedAt: updatedAt,
          done: done,
        )).called(1);
  });
}
