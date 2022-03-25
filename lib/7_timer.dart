import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  bool isBlack = true;
  bool isStop = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Timer'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                counter.toString(),
                style: TextStyle(
                  color: (isBlack) ? Colors.black : Colors.red,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                  child: Text('Ubah warna 5 detik kemudian'),
                  onPressed: () {
                    Timer(Duration(seconds: 5), () {
                      setState(() {
                        isBlack = !isBlack;
                      });
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text('Ubah Secara langsung'),
                onPressed: () {
                  Timer.run(() {
                    setState(() {
                      isBlack = !isBlack;
                    });
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text('Start Timer'),
                onPressed: () {
                  isStop = false;
                  counter = 0;
                  Timer.periodic(Duration(seconds: 1), (timer) {
                    if (isStop) timer.cancel();
                    setState(() {
                      counter++;
                    });
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text('Stop Timer'),
                onPressed: () {
                  isStop = true;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
