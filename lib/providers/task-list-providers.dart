import 'package:commerce/model/task.model.dart';
import 'package:flutter/cupertino.dart';

class TaskListProvider extends ChangeNotifier {
  List<Task> taskList = [
    Task(title: 'Order 1', descriptions: 'Order 1 descriptions'),
    Task(title: 'Order 2', descriptions: 'Order 2 descriptions'),
    Task(title: 'Order 3', descriptions: 'Order 3 descriptions'),
  ];

  update() {
    notifyListeners();
  }

  addTask(Task task) {
    taskList.add(task);
    notifyListeners();
  }

  deleteTask(int index) {
    taskList.removeAt(index);
    notifyListeners();
  }
}
