import 'dart:convert';

import 'package:challenge/actions/remove_todo/infra/datasource/remove_todo_datasource.dart';
import 'package:http/http.dart' as http;

class RemoveToDoDatasourceImpl implements RemoveToDoDatasource {
  @override
  Future<void> removeItem(String id) async {
    const url = 'https://staging.nearay.com/graphql';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'query': '''
          mutation RemoveToDo($id: ID!) {
            removeToDo(id: $id) {
              id
            }
          }
        ''',
        'variables': {
          'id': id,
        },
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to remove task: ${response.body}');
    }

    final responseData = json.decode(response.body) as Map<String, dynamic>;
    if (responseData['errors'] != null) {
      final errorMessages = (responseData['errors'] as List<dynamic>)
          .map((e) => e['message'] as String)
          .join(', ');
      throw Exception('Failed to remove task: $errorMessages');
    }
  }
}
