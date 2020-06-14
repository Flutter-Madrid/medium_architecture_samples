import 'package:flutter/material.dart';

import 'package:flutter_mvvm/core/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function onTap;

  const TodoItem({Key key, this.todo, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        todo.completed ? Icons.check_box : Icons.check_box_outline_blank,
      ),
      title: Text(todo.title),
      onTap: onTap,
    );
  }
}
