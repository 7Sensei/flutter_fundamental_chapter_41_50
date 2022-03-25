import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'color_block_package.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<ColorBloc>(
        create: (context) => ColorBloc(Colors.amber),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () {
              bloc.add(ColorEvent.to_amber);
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              bloc.add(ColorEvent.to_light_blue);
            },
          )
        ],
      ),
      appBar: AppBar(
        title: Text('Bloc Package'),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            width: 100,
            height: 100,
            color: currentColor,
            duration: Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }
}
