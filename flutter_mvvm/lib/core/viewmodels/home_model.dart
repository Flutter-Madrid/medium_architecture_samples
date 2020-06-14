import 'package:flutter/material.dart';
import 'package:flutter_mvvm/core/models/todo.dart';
import 'package:flutter_mvvm/locator.dart';

import 'package:flutter_mvvm/core/services/todos_service.dart';

class HomePageModel extends ChangeNotifier {
  TodosService _todosService = locator<TodosService>();
  bool _onlyCompleted = false;
  List<Todo> _todos;

  // Este totalTodos es para crear nuevas tareas con contador
  int totalTodos = 0;

  get todos => _onlyCompleted
      ? _todos.where((element) => element.completed).toList()
      : _todos;

  set onlyCompleted(bool value) {
    _onlyCompleted = value;
    notifyListeners();
  }

  refreshTodos() async {
    _todos = null;
    notifyListeners();

    _todos = await _todosService.getTodos();
    totalTodos = _todos.length;

    notifyListeners();
  }

  removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  toggleTodo(Todo todo) {
    int index = _todos.indexOf(todo);
    _todos[index].completed = !_todos[index].completed;
    notifyListeners();
  }

  addTodo(String title) {
    Todo todo =
        Todo(id: totalTodos++, title: title, completed: false, userId: 1);

    _todosService.postTodo(todo);
    _todos.insert(0, todo);

    notifyListeners();
  }
}
