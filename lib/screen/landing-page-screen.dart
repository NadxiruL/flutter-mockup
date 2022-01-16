import 'package:commerce/screen/homescreen.dart';
import 'package:commerce/screen/login.screen.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final bool LoggedIn = true;

  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (LoggedIn) {
      return HomeScreen();
    } else
      return LoginScreen();
  }
}
