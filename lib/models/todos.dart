import 'package:flutter/foundation.dart';
import 'package:fuston_todo_list/models/tasks.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TodoModel extends ChangeNotifier {
  List<TasksModel> tasks = [];

  void addTaks(TasksModel task) {
    tasks.add(task);
    notifyListeners();
  }

  Future<void> getTasksFromSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getString('tasks') ?? '[]';
    final jsonListTasks = jsonDecode(tasksJson).cast<Map<String, dynamic>>();
    tasks =
        jsonListTasks.map<TasksModel>((m) => TasksModel.fromJson(m)).toList();
    notifyListeners();
  }

  Future<void> saveTasksToSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(tasks);
    prefs.setString('tasks', json);
  }

  List<TasksModel> getCompletedTasks() {
    return tasks.where((t) => t.done == true).toList();
  }
}
