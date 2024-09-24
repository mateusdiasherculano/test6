import 'package:challenge/home/domain/entity/todo_model.dart';
import 'package:challenge/home/domain/repository/home_todo_repository.dart';
import 'package:challenge/home/infra/datasource/home_todo_remote_datasource.dart';

class HomeToDoRepositoryImpl implements HomeToDoRepository {
  HomeToDoRepositoryImpl(this._datasource);

  final HomeToDoRemoteDatasource _datasource;

  @override
  Future<List<ToDo>> fetchToDos() async {
    final response = await _datasource.fetchToDos();
    final List<dynamic> jsonList = response;
    final toDos = toDosFromJson(jsonList);
    return toDos;
  }
}
