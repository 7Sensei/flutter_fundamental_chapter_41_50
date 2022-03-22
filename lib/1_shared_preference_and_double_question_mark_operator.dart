import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController textEditingController =
      TextEditingController(text: 'No Name');
  bool isOn = false;

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('nama', textEditingController.text);
    pref.setBool('ison', isOn);
  }

  Future<String> getNama() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('nama') ?? "No Name";
  }

  Future<bool> getOn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('ison') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shares Preference'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: textEditingController,
              ),
              Switch(
                value: isOn,
                onChanged: (newValue) {
                  setState(() {
                    isOn = newValue;
                  });
                },
              ),
              RaisedButton(
                onPressed: () {
                  saveData();
                },
                child: Text('Save'),
              ),
              RaisedButton(
                onPressed: () {
                  getNama().then((s) {
                    textEditingController.text = s;
                    setState(() {});
                  });
                  getOn().then((b) {
                    isOn = b;
                    setState(() {});
                  });
                },
                child: Text('Load '),
              )
            ],
          ),
        ),
      ),
    );
  }
}
