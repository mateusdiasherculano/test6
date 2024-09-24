import 'package:challenge/home/domain/entity/todo_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class ToDoInitial extends HomeState {}

class ToDoLoading extends HomeState {}

class ToDoLoaded extends HomeState {
  const ToDoLoaded(this.toDos);
  final List<ToDo> toDos;

  @override
  List<Object> get props => [toDos];
}

class ToDoError extends HomeState {
  const ToDoError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
