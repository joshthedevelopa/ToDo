import 'package:flutter/material.dart';
import 'dart:async';
import '../list.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _hasSpeech = false;
  String lastWords = "";
  final SpeechToText speech = SpeechToText();

  @override
  void initState() {
    super.initState();
    initSpeechState();
    _speak(context, _hasSpeech, speech);
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize();

    if (!mounted) return;
    setState(() {
      _hasSpeech = hasSpeech;
    });
  }


  void startListening() {
    lastWords = "";
    speech.listen(onResult: resultListener );
    setState(() {
      
    });
  }

  void stopListening() {
    speech.stop( );
    setState(() {
      
    });
  }

  void cancelListening() {
    speech.cancel( );
    setState(() {
      
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = "${result.recognizedWords}";
    });
  }

  _speak(BuildContext context, bool _hasSpeech, speech) {
  showDialog(
    context: context,
    
    builder: (_)=> AlertDialog(
      title: speech.isListening ? Text("I'm listening...") : Text( 'Not listening' ),
      content: _hasSpeech
      ? Text(lastWords)
      : Center( child: Text('Speech recognition unavailable', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
      actions:_hasSpeech ? Row(
        children:[
        RaisedButton(
          color: Colors.red,
          child: Text("Start"),
          onPressed: (){
            startListening();
          }
        ),
        FlatButton(
          child: Text("Stop"),
          onPressed: (){
            stopListening();
          }
        ),
          FlatButton(
          child: Text("Cancel"),
          onPressed: (){
            cancelListening();
          }
        ),
        FlatButton(
          child: Text("Confirm"),
          onPressed: (){
            Tiles.addTile(lastWords);
          }
        )
      ]
    ): [],  
    ));
}

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: Text("Hey"),
    );
  }
}