import "package:flutter/material.dart";
import "./login.dart";

void main() => runApp(ToDo());

class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
        home:  Login(),
    );
  }
}
