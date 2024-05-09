import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _CounterState();
}

class _CounterState extends State<HomePage> {
  int _counter = 0;

  var _layout = MainAxisAlignment.center;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _nextLayout() {
    MainAxisAlignment nextEnumLayout(MainAxisAlignment value) {
      final nextIndex = (value.index + 1) % MainAxisAlignment.values.length;

      return MainAxisAlignment.values[nextIndex];
    }

    setState(() {
      _layout = nextEnumLayout(_layout);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: _layout,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Text(
                'Current Layout:',
              ),
              Text(
                '$_layout',
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          ),
        ),
        floatingActionButton: SpeedDial(
            icon: Icons.star,
            backgroundColor: Colors.blue,
            children: [
              SpeedDialChild(
                  child: const Icon(Icons.plus_one, color: Colors.white),
                  label: 'Increment',
                  backgroundColor: Colors.blueAccent,
                  onTap: _incrementCounter),
              SpeedDialChild(
                  child: const Icon(Icons.layers_outlined, color: Colors.white),
                  label: 'Layout',
                  backgroundColor: Colors.blueAccent,
                  onTap: _nextLayout)
            ]));
  }
}
