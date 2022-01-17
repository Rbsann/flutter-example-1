import 'package:flutter/foundation.dart';

class TasksModel extends ChangeNotifier {
  final String text;
  bool done;

  TasksModel({required this.text, this.done = false});

  TasksModel.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        done = json['done'];

  Map<String, dynamic> toJson() => {'text': text, 'done': done};

  void toggle() {
    done = !done;
    notifyListeners();
  }
}
