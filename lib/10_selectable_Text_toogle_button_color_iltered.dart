import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<bool> isSelected = [true, false, false];
  ColorFilter colorFiltered = ColorFilter.mode(Colors.blue, BlendMode.screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorFiltered(
        colorFilter: colorFiltered,
        child: Scaffold(
          appBar: AppBar(
            title: Text('SelectableText, ToogleButton, ColorFiltered'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableText(
                  'Ini adalah selectable text. Silakan pilih saya.',
                  style: TextStyle(fontSize: 20),
                  showCursor: true,
                  cursorWidth: 3,
                  cursorColor: Colors.red,
                ),
                ToggleButtons(
                  children: [
                    Icon(Icons.access_alarm),
                    Icon(Icons.adb),
                    Icon(Icons.add_comment),
                  ],
                  isSelected: isSelected,
                  onPressed: (index) {
                    setState(() {
                      if (index == 0)
                        colorFiltered =
                            ColorFilter.mode(Colors.blue, BlendMode.screen);
                      else if (index == 1)
                        colorFiltered =
                            ColorFilter.mode(Colors.green, BlendMode.softLight);
                      else
                        colorFiltered =
                            ColorFilter.mode(Colors.purple, BlendMode.multiply);

                      for (var i = 0; i < isSelected.length; i++)
                        isSelected[i] = (i == index) ? true : false;
                    });
                  },
                  fillColor: Colors.red[50],
                  selectedColor: Colors.red,
                  selectedBorderColor: Colors.red,
                  splashColor: Colors.blue,
                  highlightColor: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
