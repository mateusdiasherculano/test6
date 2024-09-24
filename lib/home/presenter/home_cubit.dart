// presentation/cubit/to_do_cubit.dart
import 'package:challenge/home/domain/entity/todo_model.dart';
import 'package:challenge/home/domain/usecase/home_todo_usecase.dart';
import 'package:challenge/home/presenter/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.fetchToDoUseCase) : super(ToDoInitial());
  final FetchToDosUseCase fetchToDoUseCase;

  Future<void> fetchToDosList() async {
    try {
      emit(ToDoLoading());
      final toDos = await fetchToDoUseCase.call();
      emit(ToDoLoaded(toDos));
    } catch (e) {
      emit(ToDoError(e.toString()));
    }
  }

  void toggleToDoDone(String id) {
    if (state is ToDoLoaded) {
      final currentState = state as ToDoLoaded;
      final updatedToDos = currentState.toDos.map((toDo) {
        if (toDo.id == id) {
          return ToDo(
            id: toDo.id,
            name: toDo.name,
            createdAt: toDo.createdAt,
            updatedAt: DateTime.now(),
            done: !toDo.done,
          );
        }
        return toDo;
      }).toList();
      emit(ToDoLoaded(updatedToDos));
    }
  }
}
