import 'package:commerce/model/task.model.dart';
import 'package:commerce/providers/task-list-providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  AddTask({Key? key}) : super(key: key);

  final titleTextController = new TextEditingController();
  final descTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: titleTextController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descTextController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            ElevatedButton(
              onPressed: () {
                print(titleTextController.text);
                print(descTextController.text);

                final task = Task(
                    title: titleTextController.text,
                    descriptions: descTextController.text);

                Provider.of<TaskListProvider>(context, listen: false)
                    .addTask(task);
              },
              child: Text('Masukkan task!'),
            ),
          ],
        ),
      ),
    );
  }
}
