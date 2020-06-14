import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String title;
  final bool completed;
  final Function onTap;

  const TodoItem({Key key, this.onTap, this.title, this.completed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        completed ? Icons.check_box : Icons.check_box_outline_blank,
      ),
      title: Text(title),
      onTap: onTap,
    );
  }
}
