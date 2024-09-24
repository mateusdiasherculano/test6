import 'package:bloc/bloc.dart';
import 'package:challenge/actions/add_todo/domain/usecase/add_todo_usecase.dart';
import 'package:challenge/actions/add_todo/presenter/add_todo_state.dart';

class AddToDoCubit extends Cubit<AddToDoState> {
  AddToDoCubit(this._addToDoUseCase) : super(AddToDoInitial());
  final AddToDoUseCase _addToDoUseCase;

  Future<void> addToDo({
    required String id,
    required String name,
    required String createdAt,
    required String updatedAt,
    required bool done,
  }) async {
    emit(AddToDoLoading());
    try {
      await _addToDoUseCase.execute(
        id: id,
        name: name,
        createdAt: createdAt,
        updatedAt: updatedAt,
        done: done,
      );

      emit(AddToDoSuccess());
    } catch (e) {
      emit(AddToDoError(e.toString()));
    }
  }
}
