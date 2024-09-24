import 'package:challenge/actions/remove_todo/domain/repository/remove_todo_repository.dart';
import 'package:challenge/actions/remove_todo/infra/datasource/remove_todo_datasource.dart';

class RemoveToDoRepositoryImpl implements RemoveRepository {
  RemoveToDoRepositoryImpl(this._datasource);

  final RemoveToDoDatasource _datasource;
  @override
  Future<void> removeToDoById(String id) async {
    final response = _datasource.removeItem(id);
    return response;
  }
}
