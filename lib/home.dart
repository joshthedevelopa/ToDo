import "package:flutter/material.dart";
import './list.dart';
import './screen/signin_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text("Main Menu", style: TextStyle(fontSize: 30)),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              ListTile(
                  title: Text('Sign out'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignInScreen()));
                  }),
            ],
          ),
        ),
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          title: Text("Tasks",
              style: TextStyle(fontSize: 25.0, color: Colors.black)),
          backgroundColor: Colors.white,
          bottom: TabBar(
            tabs: [
              Tab(
                  child: Text('Ongoing Tasks',
                      style: TextStyle(fontSize: 18.0, color: Colors.black))),
              Tab(
                  child: Text('Completed Tasks',
                      style: TextStyle(fontSize: 18.0, color: Colors.black)))
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Lists(),
            Complete(),
          ],
        ),
      ),
    );
  }
}
