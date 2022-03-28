import 'package:flutter/material.dart';
import 'package:flutter_fundamental_chapter_41_50/6_user_profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final UserProfile userProfile = new UserProfile();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red[900],
            title: Text("Doc Comment"),
          ),
          body: Center(
            child: userProfile,
          )),
    );
  }
}
