import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      // to hide debug banner
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class PageData {
  final String name;

  PageData({
    required this.name,
  });
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<PageData> users = [
    PageData(name: "Page 1"),
    PageData(name: "Page 2"),
    PageData(name: "Page 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page View Demo")),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Center(
            child: Text('This is ${users[index].name}'),
          );
        },
      ),
    );
  }
}