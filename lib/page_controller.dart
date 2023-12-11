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

  //Page Controller can be used to change page displayed in page view
  final controller = PageController(initialPage: 1);

  final List<PageData> users = [
    PageData(name: "Page 1"),
    PageData(name: "Page 2"),
    PageData(name: "Page 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page View Demo"),
        actions: [
          IconButton(
              onPressed: () => {
                controller.previousPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut
                )
              },
              icon: const Icon(Icons.keyboard_arrow_left)
          ),
          IconButton(
              onPressed: () => {
                controller.nextPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut
                )
              },
              icon: const Icon(Icons.keyboard_arrow_right)
          )
        ],
      ),
      body: PageView.builder(
        controller: controller,
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