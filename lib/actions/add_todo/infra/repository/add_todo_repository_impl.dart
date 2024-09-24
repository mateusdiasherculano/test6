import 'package:challenge/actions/add_todo/domain/repository/add_todo_repository.dart';
import 'package:challenge/actions/add_todo/infra/datasources/add_todo_datasource.dart';

class AddToDoRepositoryImpl implements AddToDoRepository {
  AddToDoRepositoryImpl(this._datasource);
  final AddToDoDatasource _datasource;

  @override
  Future<void> addTask({
    required String id,
    required String name,
    required String createdAt,
    required String updatedAt,
    required bool done,
  }) async {
    await _datasource.addTask(
      id: id,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
      done: done,
    );
  }
}
