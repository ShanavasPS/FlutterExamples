import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Step 1: Create a data provider class
class CounterProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class TimerProvider extends ChangeNotifier {
  var countdown = 60;
  Timer? _timer;
  bool get isActive => _timer?.isActive ?? false;
  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (countdown == 0) {
        _timer?.cancel();
        notifyListeners();
        return;
      }
      countdown--;
      notifyListeners();
    });
  }
  void stop() {
    _timer?.cancel();
    notifyListeners();
  }
}

void main() {
  runApp(
    // Step 2: Wrap your app with MultiProvider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => TimerProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Step 3: Use the Consumer widget to access data
    return Consumer2<CounterProvider, TimerProvider>(
      builder: (context, counterProvider, timerProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Counter App'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Count:',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '${counterProvider.count}',
                  style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Time: ${timerProvider.countdown.toString()} Seconds',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: timerProvider.isActive
                      ? timerProvider.stop
                      : timerProvider.startCountdown,
                  child: Text(timerProvider.isActive ? 'Stop' : 'Start'),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Step 4: Trigger state update
              counterProvider.increment();
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}