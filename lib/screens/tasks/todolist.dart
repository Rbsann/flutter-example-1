import 'package:flutter/material.dart';
import 'package:fuston_todo_list/models/tasks.dart';
import 'package:fuston_todo_list/models/todos.dart';
import 'package:fuston_todo_list/screens/tasks/task.dart';
import 'package:provider/provider.dart';

class TodoListWidget extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(child: Consumer<TodoModel>(builder: (context, tasks, child) {
        return ListView(
          children: tasks.tasks.map((TasksModel task) {
            return ChangeNotifierProvider.value(
                value: task, child: const TaskWidget());
          }).toList(),
        );
      })),
      Consumer<TodoModel>(
        builder: (context, tasks, child) {
          return TextField(
            controller: _controller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)),
                labelText: 'new task'),
            onSubmitted: (newTask) {
              tasks.addTaks(TasksModel(text: newTask));
              _controller.clear();
              tasks.saveTasksToSharedPrefs();
            },
          );
        },
      )
    ]);
  }
}
