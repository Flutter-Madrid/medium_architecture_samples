import 'package:http/http.dart' as http;

import 'package:flutter_mvvm/core/models/todo.dart';

class TodosService {
  String baseEndpoint = 'https://jsonplaceholder.typicode.com';

  Future<List<Todo>> getTodos() async {
    var response = await http.get('$baseEndpoint/todos');

    return todoListFromJson(response.body);
  }

  Future<void> postTodo(Todo todo) async {
    await http.post(
      '$baseEndpoint/todos',
      body: todoToJson(todo),
    );
  }
}
