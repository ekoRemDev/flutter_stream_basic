import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // todo 1 create a stream controller
  StreamController<double> controller = StreamController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(child: Row(children: <Widget>[
          MaterialButton(
            child: Text("Subscribe"),
            color: Colors.yellow,
            onPressed: (){
              // todo 2 access the controller
              Stream stream = controller.stream;
              stream.listen((value){
                print(value);
              });
            },
          )
        ],),),
      ),
    );
  }
}

