import 'package:flutter/material.dart';
import 'package:fuston_todo_list/models/todos.dart';

class CompletedTasks extends StatelessWidget {
  final TodoModel todoList;

  const CompletedTasks({required this.todoList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Completed Items'),
        ),
        body: ListView(
            children: todoList.getCompletedTasks().map((t) {
          return SizedBox(
              height: 50,
              child: Center(
                  child: Text(t.text, style: const TextStyle(fontSize: 20))));
        }).toList()));
  }
}
