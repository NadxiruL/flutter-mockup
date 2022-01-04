import 'package:commerce/model/task.model.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('Deligram'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
                taskList.length,
                (index) => TaskContainer(
                      task: taskList[index],
                    ))));
  }
}

class TaskContainer extends StatelessWidget {
  final Task task;

  const TaskContainer({required this.task});

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
    );
  }
}