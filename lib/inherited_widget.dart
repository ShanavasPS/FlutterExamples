import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyHomePage(),
    ),
  );
}

class CounterInheritedWidget extends InheritedWidget {
  final int counter;
  final VoidCallback increment;
  final Widget childWidget;

  const CounterInheritedWidget({super.key,
    required this.counter,
    required this.increment,
    required this.childWidget,
  }) : super(child: childWidget);

  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) {
    return counter != oldWidget.counter;
  }

  static CounterInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();
  }
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

  void increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('rebuild MyHomePage');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inherited Widget'),
      ),
      body: CounterInheritedWidget(
          counter: _counter,
          increment: increment,
          childWidget: Builder(
            builder: (BuildContext innerContext) {
              return const MyCenterWidget();
              },
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('rebuild MyCenterWidget');
    }
    return const Center(
      child: CounterWidget(),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('rebuild CounterWidget');
    }
    final myInheritedWidget = CounterInheritedWidget.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Count:',
          style: TextStyle(fontSize: 24),
        ),
        Text(
          '${myInheritedWidget?.counter}',
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
