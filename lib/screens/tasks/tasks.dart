import 'package:provider/provider.dart';
import 'package:fuston_todo_list/models/todos.dart';
import 'package:fuston_todo_list/screens/completed_tasks/completed_tasks.dart';
import 'package:fuston_todo_list/screens/tasks/todolist.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  void _goToCompletedTasks(context, todoList) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CompletedTasks(todoList: todoList)));
  }

  @override
  Widget build(BuildContext context) {
    final TodoModel todoList = TodoModel();
    todoList.getTasksFromSharedPrefs();

    return Scaffold(
        appBar: AppBar(
          title: const Text('TodoList'),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () => _goToCompletedTasks(context, todoList)))
          ],
        ),
        body: ChangeNotifierProvider.value(
          value: todoList,
          child: TodoListWidget(),
        ));
  }
}
