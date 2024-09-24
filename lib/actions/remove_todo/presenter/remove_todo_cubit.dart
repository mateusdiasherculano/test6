import 'package:bloc/bloc.dart';
import 'package:challenge/actions/remove_todo/domain/usecase/remove_todo_usecase.dart';
import 'package:challenge/actions/remove_todo/presenter/remove_todo_state.dart';

class RemoveToDoCubit extends Cubit<RemoveToDoState> {
  RemoveToDoCubit(this.removeToDoUseCase) : super(RemoveToDoInitial());
  final RemoveToDoUseCase removeToDoUseCase;

  Future<void> removeItem(String id) async {
    try {
      emit(RemoveToDoLoading());
      await removeToDoUseCase.call(id);
      emit(RemoveToDoSuccess());
    } catch (e) {
      emit(RemoveToDoError(e.toString()));
    }
  }
}
