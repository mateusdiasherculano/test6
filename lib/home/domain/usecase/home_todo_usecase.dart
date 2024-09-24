import 'package:challenge/home/domain/entity/todo_model.dart';
import 'package:challenge/home/domain/repository/home_todo_repository.dart';

class FetchToDosUseCase {
  FetchToDosUseCase(this._repository);

  final HomeToDoRepository _repository;

  Future<List<ToDo>> call() {
    return _repository.fetchToDos();
  }
}
