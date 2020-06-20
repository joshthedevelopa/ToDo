import "package:flutter/material.dart";

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      home:  Scaffold(
        appBar: AppBar(
          title: Text("Welcome to the HomePage") ) ,
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
