import 'package:flutter/cupertino.dart';

@immutable
abstract class AddToDoState {}

class AddToDoInitial extends AddToDoState {}

class AddToDoLoading extends AddToDoState {}

class AddToDoSuccess extends AddToDoState {}

class AddToDoError extends AddToDoState {
  AddToDoError(this.message);
  final String message;
}
