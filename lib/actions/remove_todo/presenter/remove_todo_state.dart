abstract class RemoveToDoState {}

class RemoveToDoInitial extends RemoveToDoState {}

class RemoveToDoLoading extends RemoveToDoState {}

class RemoveToDoSuccess extends RemoveToDoState {}

class RemoveToDoError extends RemoveToDoState {
  RemoveToDoError(this.message);
  final String message;
}
