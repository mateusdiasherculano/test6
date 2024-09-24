import 'package:challenge/actions/remove_todo/domain/repository/remove_todo_repository.dart';

class RemoveToDoUseCase {
  RemoveToDoUseCase(this.repository);
  final RemoveRepository repository;

  Future<void> call(String id) async {
    return repository.removeToDoById(id);
  }
}
