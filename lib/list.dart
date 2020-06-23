

import "package:flutter/material.dart";


class Lists extends StatefulWidget {
  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  List<String> _items =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: (){setState((){
          return null;
  }
  );
  },
  ),
      body: ListView(
          children: _items.map(
            (element) => Card(
              child: ListTile(
              trailing: Icon(Icons.more_vert),
              title: Text(element, style: TextStyle(fontSize:20)),
          )
          )).toList(),
      ),
    );
  }
}
