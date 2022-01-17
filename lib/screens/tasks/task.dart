import 'package:flutter/material.dart';
import 'package:fuston_todo_list/models/tasks.dart';
import 'package:provider/provider.dart';
import 'package:fuston_todo_list/models/todos.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key}) : super(key: key);

  TextStyle _taskStyle(completed) {
    if (completed) {
      return const TextStyle(
        color: Colors.black54,
        decoration: TextDecoration.lineThrough,
      );
    } else {
      return const TextStyle(decoration: TextDecoration.none);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksModel>(builder: (context, task, child) {
      return CheckboxListTile(
        title: Text(
          task.text,
          style: _taskStyle(task.done),
        ),
        value: task.done,
        onChanged: (value) {
          task.toggle();
          Provider.of<TodoModel>(context, listen: false)
              .saveTasksToSharedPrefs();
        },
        controlAffinity: ListTileControlAffinity.leading,
      );
    });
  }
}
