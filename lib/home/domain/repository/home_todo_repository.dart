import 'package:challenge/home/domain/entity/todo_model.dart';

abstract class HomeToDoRepository {
  Future<List<ToDo>> fetchToDos();
}
