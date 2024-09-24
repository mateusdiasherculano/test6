import 'package:challenge/home/domain/entity/todo_model.dart';
import 'package:equatable/equatable.dart';

class AddToDoResponse extends Equatable {
  const AddToDoResponse({required this.addToDo});

  factory AddToDoResponse.fromJson(Map<String, dynamic> json) {
    final data =
        json['data'] as Map<String, dynamic>?; // Verifica a chave 'data'
    final addToDoJson = data?['addToDo'] as Map<String, dynamic>?;
    if (addToDoJson != null) {
      final addToDo = ToDo.fromJson(addToDoJson);
      return AddToDoResponse(addToDo: addToDo);
    } else {
      throw Exception('addToDo is not a Map<String, dynamic>');
    }
  }

  final ToDo addToDo;

  Map<String, dynamic> toJson() {
    return {
      'data': {
        'addToDo': addToDo.toJson(),
      },
    };
  }

  @override
  List<Object?> get props => [addToDo];
}
