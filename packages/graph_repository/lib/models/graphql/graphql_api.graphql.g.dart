// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDo _$ToDoFromJson(Map<String, dynamic> json) => ToDo()
  ..id = json['id'] as String
  ..name = json['name'] as String
  ..createdAt = json['createdAt'] as String
  ..updatedAt = json['updatedAt'] as String?
  ..done = json['done'] as bool?;

Map<String, dynamic> _$ToDoToJson(ToDo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'done': instance.done,
    };

GetToDos$Query _$GetToDos$QueryFromJson(Map<String, dynamic> json) =>
    GetToDos$Query()
      ..toDos = (json['toDos'] as List<dynamic>)
          .map((e) => ToDo.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetToDos$QueryToJson(GetToDos$Query instance) =>
    <String, dynamic>{
      'toDos': instance.toDos.map((e) => e.toJson()).toList(),
    };

UpdateToDo$Mutation _$UpdateToDo$MutationFromJson(Map<String, dynamic> json) =>
    UpdateToDo$Mutation()
      ..updateToDo = ToDo.fromJson(json['updateToDo'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateToDo$MutationToJson(
        UpdateToDo$Mutation instance) =>
    <String, dynamic>{
      'updateToDo': instance.updateToDo.toJson(),
    };

ToDoInput _$ToDoInputFromJson(Map<String, dynamic> json) => ToDoInput(
      id: json['id'] as String,
      name: json['name'] as String,
      done: json['done'] as bool?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ToDoInputToJson(ToDoInput instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'done': instance.done,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

AddToDo$Mutation _$AddToDo$MutationFromJson(Map<String, dynamic> json) =>
    AddToDo$Mutation()
      ..addToDo = ToDo.fromJson(json['addToDo'] as Map<String, dynamic>);

Map<String, dynamic> _$AddToDo$MutationToJson(AddToDo$Mutation instance) =>
    <String, dynamic>{
      'addToDo': instance.addToDo.toJson(),
    };

DeleteToDo$Mutation _$DeleteToDo$MutationFromJson(Map<String, dynamic> json) =>
    DeleteToDo$Mutation()..deleteToDoAsync = json['deleteToDoAsync'] as bool;

Map<String, dynamic> _$DeleteToDo$MutationToJson(
        DeleteToDo$Mutation instance) =>
    <String, dynamic>{
      'deleteToDoAsync': instance.deleteToDoAsync,
    };

UpdateToDoArguments _$UpdateToDoArgumentsFromJson(Map<String, dynamic> json) =>
    UpdateToDoArguments(
      input: ToDoInput.fromJson(json['input'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateToDoArgumentsToJson(
        UpdateToDoArguments instance) =>
    <String, dynamic>{
      'input': instance.input.toJson(),
    };

AddToDoArguments _$AddToDoArgumentsFromJson(Map<String, dynamic> json) =>
    AddToDoArguments(
      input: ToDoInput.fromJson(json['input'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddToDoArgumentsToJson(AddToDoArguments instance) =>
    <String, dynamic>{
      'input': instance.input.toJson(),
    };

DeleteToDoArguments _$DeleteToDoArgumentsFromJson(Map<String, dynamic> json) =>
    DeleteToDoArguments(
      id: json['id'] as String,
    );

Map<String, dynamic> _$DeleteToDoArgumentsToJson(
        DeleteToDoArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
