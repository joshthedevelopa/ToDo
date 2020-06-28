import "package:flutter/material.dart";
import 'dart:async';

import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class Lists extends StatefulWidget {
  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  bool _hasSpeech = false;
  String lastWords = "";
  final SpeechToText speech = SpeechToText();


  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize();

    if (!mounted) return;
    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  void startListening(Function setState) {
    lastWords = "";
    speech.listen(onResult: (result) {
      setState(() {
        lastWords = "${result.recognizedWords}";
      });
    });
  }

  void stopListening() {
    speech.stop();
    setState(() {});
  }

  void cancelListening() {
    speech.cancel();
    setState(() {});
  }

  void _speak(BuildContext context, bool _hasSpeech, speech) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              print("Alert Rebuilds");
              print(lastWords);
              return AlertDialog(
                title: Text("What do you want to do?"),
                content: _hasSpeech
                    ? Text("$lastWords")
                    : Center(
                        child: Text(
                          'Speech recognition unavailable',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                actions: _hasSpeech
                    ? [
                        Row(children: [
                          RaisedButton(
                            color: Colors.red,
                            child: Text("Start"),
                            onPressed: () {
                              startListening(setState);
                              // setState(() {});
                            },
                          ),
                          FlatButton(
                              child: Text("Stop"), onPressed: stopListening),
                          FlatButton(
                              child: Text("Reject"),
                              onPressed: () {
                                lastWords = '';
                              }),
                          FlatButton(
                              child: Text("Confirm"),
                              onPressed: () {
                                Navigator.of(context).pop();
                                if (lastWords.length > 0)
                                  Tiles.addTile(lastWords);
                                lastWords = '';
                              })
                        ])
                      ]
                    : null,
              );
            },
          );
        });
  }

  TextEditingController _myController = TextEditingController();

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initSpeechState();
    return Scaffold(
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          heroTag: 0,
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
          onPressed: () {
            _dialog(context, _myController);
            setState(() {});
          },
        ),
        FloatingActionButton(
          heroTag: 1,
          child: Icon(Icons.mic),
          backgroundColor: Colors.red,
          onPressed: () {
            _speak(context, _hasSpeech, speech);
          },
        )
      ]),
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
                    child: Text('Complete?',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500))),
              ),
              onDismissed: (left) {
                setState(() {
                  Tiles.lists.removeAt(index);
                  Tiles.completed.add(item);
                });
              },
              child: Card(
                  child: ListTile(
                title: Text(Tiles.lists[index], style: TextStyle(fontSize: 20)),
              )));
        },
      ),
    );
  }

  _dialog(BuildContext context, _myController) {
    String _item;
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
                title: Text("What do you want to do?"),
                content: TextFormField(
                  controller: _myController,
                  autofocus: false,
                  decoration: InputDecoration(
                      labelText: "Type in the task",
                      hintText: "e.g Water plant."),
                  validator: (value) =>
                      value.isEmpty ? 'Task can\'t be empty' : null,
                  onSaved: (value) => _item.trim(),
                ),
                actions: [
                  RaisedButton(
                      color: Colors.red,
                      child: Text("Add"),
                      onPressed: () {
                        Tiles.addTile(_myController.text);
                        _myController.clear();
                        Navigator.pop(context);
                        setState(() {});
                      }),
                  FlatButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        _myController.clear();
                        Navigator.of(context).pop();
                      })
                ]));
  }
}

class Tiles {
  static List lists = [];
  static List completed = [];

  static void addTile(value) {
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
        body: ListView.builder(
      itemCount: Tiles.completed.length,
      itemBuilder: (BuildContext context, int index) {
        final item = Tiles.completed[index];
        return Dismissible(
            key: Key(item),
            background: Container(
              color: Colors.red,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                  child: Text('Delete?',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500))),
            ),
            onDismissed: (left) {
              setState(() {
                Tiles.completed.removeAt(index);
              });
            },
            child: Card(
                child: ListTile(
              title:
                  Text(Tiles.completed[index], style: TextStyle(fontSize: 20)),
            )));
      },
    ));
  }
}
