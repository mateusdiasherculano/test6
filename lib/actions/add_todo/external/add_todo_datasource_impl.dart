import 'dart:convert';

import 'package:challenge/actions/add_todo/domain/entity/add_todo_response.dart';
import 'package:challenge/actions/add_todo/infra/datasources/add_todo_datasource.dart';
import 'package:http/http.dart' as http;

class AddToDoDatasourceImpl extends AddToDoDatasource {
  @override
  Future<AddToDoResponse> addTask({
    required String id,
    required String name,
    required String createdAt,
    required String updatedAt,
    required bool done,
  }) async {
    const url = 'https://staging.nearay.com/graphql';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'query': r'''
      mutation AddToDo($input: ToDoInput!) {
        addToDo(input: $input) {
          id
          name
          createdAt
          updatedAt
          done
        }
      }
      ''',
        'variables': {
          'input': {
            'id': id,
            'name': name,
            'createdAt': createdAt,
            'updatedAt': updatedAt,
            'done': done,
          },
        },
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add task: ${response.body}');
    }

    final responseData = json.decode(response.body) as Map<String, dynamic>;
    final addToDoResponse = AddToDoResponse.fromJson(responseData);

    return addToDoResponse;
  }
}
