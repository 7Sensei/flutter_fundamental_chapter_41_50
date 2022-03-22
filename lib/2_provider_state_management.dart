import 'package:flutter/material.dart';
import 'package:flutter_fundamental_chapter_41_50/aplication_color.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<AplicationColor>(
        create: (context) => AplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Consumer<AplicationColor>(
              builder: (context, applicationcolors, _) => Text(
                'Provider State Management',
                style: TextStyle(
                  color: applicationcolors.color,
                ),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<AplicationColor>(
                  builder: (context, applicationcolors, _) => AnimatedContainer(
                    width: 100,
                    height: 100,
                    color: applicationcolors.color,
                    duration: Duration(milliseconds: 500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text('AB'),
                    ),
                    Consumer<AplicationColor>(
                      builder: (context, applicationcolors, _) => Switch(
                        value: applicationcolors.islighblue,
                        onChanged: (newValue) {
                          applicationcolors.islighblue = newValue;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text('LB'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
