import 'package:challenge/actions/add_todo/domain/repository/add_todo_repository.dart';

class AddToDoUseCase {
  AddToDoUseCase(this._repository);

  final AddToDoRepository _repository;

  Future<void> execute({
    required String id,
    required String name,
    required String createdAt,
    required String updatedAt,
    required bool done,
  }) async {
    await _repository.addTask(
      id: id,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
      done: done,
    );
  }
}
