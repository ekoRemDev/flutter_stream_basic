import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // todo 1 create a stream controller
  StreamController<double> controller = StreamController<double>.broadcast();

  StreamSubscription<double> streamSubscription;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MaterialButton(
                child: Text("Subscribe"),
                color: Colors.yellow,
                onPressed: () async{

//                  Stream stream = controller.stream;
//                  streamSubscription = stream.listen((value) {
//                    print(value);
//                  });

//                var value1 = await getDelayedRandomValue();
//                var value2 = await getDelayedRandomValue();


                getDelayedRandomValue().listen((value){
                  print("value from stream $value");
                });

                },
              ),
              MaterialButton(
                child: Text("Emit Value"),
                color: Colors.blue[200],
                onPressed: (){
                  controller.add(12);
                },
              ),
              MaterialButton(
                child: Text("Unsubscribe"),
                color: Colors.red[200],
                onPressed: (){
                  streamSubscription.cancel();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stream<double> getDelayedRandomValue() async*{
    var random = Random();

    while(true){
      await Future.delayed(Duration(seconds: 1));
      yield random.nextDouble();
    }

  }
}
