import "package:flutter/material.dart";
import 'home.dart';
import "screen/signin_screen.dart";

void main() => runApp(ToDo());

class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home:  Home(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
