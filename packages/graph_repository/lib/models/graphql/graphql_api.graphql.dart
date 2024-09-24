// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class ToDo extends JsonSerializable with EquatableMixin {
  ToDo();

  factory ToDo.fromJson(Map<String, dynamic> json) => _$ToDoFromJson(json);

  late String id;

  late String name;

  late String createdAt;

  String? updatedAt;

  bool? done;

  @override
  List<Object?> get props => [id, name, createdAt, updatedAt, done];
  @override
  Map<String, dynamic> toJson() => _$ToDoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetToDos$Query extends JsonSerializable with EquatableMixin {
  GetToDos$Query();

  factory GetToDos$Query.fromJson(Map<String, dynamic> json) =>
      _$GetToDos$QueryFromJson(json);

  late List<ToDo> toDos;

  @override
  List<Object?> get props => [toDos];
  @override
  Map<String, dynamic> toJson() => _$GetToDos$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateToDo$Mutation extends JsonSerializable with EquatableMixin {
  UpdateToDo$Mutation();

  factory UpdateToDo$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateToDo$MutationFromJson(json);

  late ToDo updateToDo;

  @override
  List<Object?> get props => [updateToDo];
  @override
  Map<String, dynamic> toJson() => _$UpdateToDo$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ToDoInput extends JsonSerializable with EquatableMixin {
  ToDoInput({
    required this.id,
    required this.name,
    this.done,
    required this.createdAt,
    this.updatedAt,
  });

  factory ToDoInput.fromJson(Map<String, dynamic> json) =>
      _$ToDoInputFromJson(json);

  late String id;

  late String name;

  bool? done;

  late String createdAt;

  String? updatedAt;

  @override
  List<Object?> get props => [id, name, done, createdAt, updatedAt];
  @override
  Map<String, dynamic> toJson() => _$ToDoInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddToDo$Mutation extends JsonSerializable with EquatableMixin {
  AddToDo$Mutation();

  factory AddToDo$Mutation.fromJson(Map<String, dynamic> json) =>
      _$AddToDo$MutationFromJson(json);

  late ToDo addToDo;

  @override
  List<Object?> get props => [addToDo];
  @override
  Map<String, dynamic> toJson() => _$AddToDo$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteToDo$Mutation extends JsonSerializable with EquatableMixin {
  DeleteToDo$Mutation();

  factory DeleteToDo$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeleteToDo$MutationFromJson(json);

  late bool deleteToDoAsync;

  @override
  List<Object?> get props => [deleteToDoAsync];
  @override
  Map<String, dynamic> toJson() => _$DeleteToDo$MutationToJson(this);
}

final GET_TO_DOS_QUERY_DOCUMENT_OPERATION_NAME = 'GetToDos';
final GET_TO_DOS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetToDos'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'toDos'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'updatedAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'done'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class GetToDosQuery extends GraphQLQuery<GetToDos$Query, JsonSerializable> {
  GetToDosQuery();

  @override
  final DocumentNode document = GET_TO_DOS_QUERY_DOCUMENT;

  @override
  final String operationName = GET_TO_DOS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetToDos$Query parse(Map<String, dynamic> json) =>
      GetToDos$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateToDoArguments extends JsonSerializable with EquatableMixin {
  UpdateToDoArguments({required this.input});

  @override
  factory UpdateToDoArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateToDoArgumentsFromJson(json);

  late ToDoInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$UpdateToDoArgumentsToJson(this);
}

final UPDATE_TO_DO_MUTATION_DOCUMENT_OPERATION_NAME = 'UpdateToDo';
final UPDATE_TO_DO_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateToDo'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'ToDoInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateToDo'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'updatedAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'done'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class UpdateToDoMutation
    extends GraphQLQuery<UpdateToDo$Mutation, UpdateToDoArguments> {
  UpdateToDoMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_TO_DO_MUTATION_DOCUMENT;

  @override
  final String operationName = UPDATE_TO_DO_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateToDoArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateToDo$Mutation parse(Map<String, dynamic> json) =>
      UpdateToDo$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class AddToDoArguments extends JsonSerializable with EquatableMixin {
  AddToDoArguments({required this.input});

  @override
  factory AddToDoArguments.fromJson(Map<String, dynamic> json) =>
      _$AddToDoArgumentsFromJson(json);

  late ToDoInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$AddToDoArgumentsToJson(this);
}

final ADD_TO_DO_MUTATION_DOCUMENT_OPERATION_NAME = 'AddToDo';
final ADD_TO_DO_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'AddToDo'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'ToDoInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'addToDo'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'updatedAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'done'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class AddToDoMutation extends GraphQLQuery<AddToDo$Mutation, AddToDoArguments> {
  AddToDoMutation({required this.variables});

  @override
  final DocumentNode document = ADD_TO_DO_MUTATION_DOCUMENT;

  @override
  final String operationName = ADD_TO_DO_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final AddToDoArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  AddToDo$Mutation parse(Map<String, dynamic> json) =>
      AddToDo$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DeleteToDoArguments extends JsonSerializable with EquatableMixin {
  DeleteToDoArguments({required this.id});

  @override
  factory DeleteToDoArguments.fromJson(Map<String, dynamic> json) =>
      _$DeleteToDoArgumentsFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$DeleteToDoArgumentsToJson(this);
}

final DELETE_TO_DO_MUTATION_DOCUMENT_OPERATION_NAME = 'DeleteToDo';
final DELETE_TO_DO_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteToDo'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'deleteToDoAsync'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: null,
      )
    ]),
  )
]);

class DeleteToDoMutation
    extends GraphQLQuery<DeleteToDo$Mutation, DeleteToDoArguments> {
  DeleteToDoMutation({required this.variables});

  @override
  final DocumentNode document = DELETE_TO_DO_MUTATION_DOCUMENT;

  @override
  final String operationName = DELETE_TO_DO_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final DeleteToDoArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DeleteToDo$Mutation parse(Map<String, dynamic> json) =>
      DeleteToDo$Mutation.fromJson(json);
}
