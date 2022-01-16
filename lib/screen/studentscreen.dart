import 'package:commerce/model/student.model.dart';
import 'package:flutter/material.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: testBuild(),
      body: Expanded(
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(
            studentList.length,
            (index) => StudentListWidget(student: studentList[index]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  PreferredSizeWidget? testBuild() {
    return AppBar(
      title: Text('Student List'),
    );
  }
}

class StudentListWidget extends StatelessWidget {
  final Student student;

  StudentListWidget({required this.student});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      student.name,
                      style: const TextStyle(fontSize: 30, color: Colors.black),
                    ),
                    Text(
                      student.age,
                      style: const TextStyle(fontSize: 30, color: Colors.black),
                    ),
                    Text(
                      student.sex,
                      style: const TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Icon(Icons.delete),
            ],
          ),
        ),
      ),
    );
  }
}
