import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  @override
  void initState() {
    super.initState();
  }

  void increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('rebuild MyHomePage');
    }

    return Scaffold(
      body: MyCenterWidget(counter: _counter),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({required this.counter, super.key});

  final int counter;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('rebuild MyCenterWidget');
    }
    return Center(
      child: CounterWidget(counter: counter),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({required this.counter, super.key});

  final int counter;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('rebuild CounterWidget');
    }

    return Text(
        '$counter'
    );
  }
}
