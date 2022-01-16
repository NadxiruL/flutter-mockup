import 'package:commerce/model/task.model.dart';
import 'package:commerce/providers/task-list-providers.dart';
import 'package:commerce/screen/add-task-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskListProvider>(
      create: (BuildContext context) => TaskListProvider(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              // ignore: prefer_const_constructors
              title: Text('Deligram'),
            ),
            body: Consumer<TaskListProvider>(
              builder: (BuildContext context, taskListProvider, child) {
                final taskList = taskListProvider.taskList;
                return ListView(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    taskList.length,
                    (i) {
                      return TaskContainer(
                        task: taskList[i],
                        index: i,
                      );
                    },
                  ),
                );
              },
            ),
            floatingActionButton:
                Column(mainAxisSize: MainAxisSize.min, children: [
              FloatingActionButton(
                onPressed: () {
                  final taskListProvider =
                      Provider.of<TaskListProvider>(context, listen: false);
                  final taskList = taskListProvider.taskList;
                  final newTask = Task(
                      title: 'Task ${taskList.length + 1} ',
                      descriptions: 'Task ${taskList.length + 1} Descriptions');
                  taskListProvider.addTask(newTask);
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTask(),
                      ));
                },
                child: Icon(Icons.arrow_right),
              ),
            ]),
          );
        },
      ),
    );
  }
}

class TaskContainer extends StatelessWidget {
  final Task task;
  final int index;

  const TaskContainer({required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(),
        ),
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    task.title,
                    style: TextStyle(fontSize: 24),
                  ),
                  Container(),
                  Text(
                    task.descriptions,
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
            Material(
              color: Colors.transparent,
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  final taskListProvider =
                      Provider.of<TaskListProvider>(context, listen: false);
                  taskListProvider.deleteTask(index);
                  //final taskList = taskListProvider.taskList;
                  // taskList.removeAt(index);
                  // taskListProvider.update();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CustomText extends InheritedWidget {
//   final Widget child;
//   final String text;

//   const CustomText({
//     required this.child,
//     required this.text,
//   }) : super(child: child);

//   @override
//   bool updateShouldNotify(CustomText oldWidget) {
//     if (oldWidget.text != text)
//       return true;
//     else
//       return false;
//   }
// }
