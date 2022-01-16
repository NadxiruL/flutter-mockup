import 'package:commerce/providers/task-list-providers.dart';
import 'package:commerce/screen/homescreen.dart';
import 'package:commerce/screen/landing-page-screen.dart';
import 'package:commerce/screen/test.screen.dart';
import 'package:flutter/material.dart';
import 'dart:core';

import 'package:provider/provider.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskListProvider>(
      create: (context) => TaskListProvider(),
      child: Builder(builder: (context) {
        return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.orange,
            ),
            home: const TestScreen());
      }),
    );
  }
}
