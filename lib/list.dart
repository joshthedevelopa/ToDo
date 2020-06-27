import "package:flutter/material.dart";

class Lists extends StatefulWidget {
  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  TextEditingController _myController= TextEditingController();

  @override
  void dispose(){
    _myController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () {
          _dialog(context, _myController);
          setState(() {});
        },
      ),
      body: ListView.builder(
        itemCount: Tiles.lists.length,
        itemBuilder: (BuildContext context, int index) {
          final item = Tiles.lists[index];
          return Dismissible(
            key: Key(item),
            background: Container(
              color: Colors.green,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
              child:Text(
                'Complete?', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500))),
            ),
            onDismissed: (left){
              setState((){
                Tiles.lists.removeAt(index);
                Tiles.completed.add(item);
              });
            },
            child: Card(
            child: ListTile(
            trailing: Icon(Icons.more_vert),
            title: Text(Tiles.lists[index], style: TextStyle(fontSize: 20)),
          )
          )
          );
        },
      ),
    );
  }





  _dialog(BuildContext context, _myController) {
  String _item;
  showDialog(
    context: context,
    builder: (_)=> AlertDialog(
      title: Text("What do you want to do?"),
      content: TextFormField(
        controller: _myController,
        autofocus: false,
        decoration: InputDecoration(
          labelText: "Type in the task",
          hintText: "e.g Water plant."
         ),
         validator: (value) => value.isEmpty ? 'Task can\'t be empty': null,
         onSaved: (value) => _item.trim(),
      ) , 
      actions:[
        RaisedButton(
          color: Colors.red,
          child: Text("Add"),
          onPressed: (){
            Tiles.addTile(_myController.text);
            _myController.clear();
            Navigator.pop(context);
            setState((){});
          }
        ),
        FlatButton(
          child: Text("Cancel"),
          onPressed: (){
            _myController.clear();
            Navigator.of(context).pop();
          }
        )
      ]
    )  
    );
}
}

class Tiles {
  static List lists = [];
  static List completed = [];

  static void addTile(value){
    lists.add(value);
  }
}

class Complete extends StatefulWidget {
  @override
  _CompleteState createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:  ListView.builder(
    itemCount: Tiles.completed.length,
    itemBuilder: (BuildContext context, int index){
      final item = Tiles.completed[index];
          return Dismissible(
            key: Key(item),
            background: Container(
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
              child:Text(
                'Delete?', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500))),
            ),
            onDismissed: (left){
              setState((){
                Tiles.completed.removeAt(index);
              });
            },
          child: Card(
          child: ListTile(
            title: Text(Tiles.completed[index], style: TextStyle(fontSize: 20)),
          )
          )
          );
    },
  ) 
  );
  }
}

