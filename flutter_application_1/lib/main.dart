import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BERANDA"),
        backgroundColor: const Color.fromARGB(255, 203, 203, 201),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.settings),
        ],
      ),
      body:Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:]
            Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(255, 195, 51, 220),
              child: Center(child: Text("viraa")),
            ),
            Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(255, 180, 64, 153),
              child: Center(child: Text("litha")),
            ),
            Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(255, 214, 89, 200),
              child: Center(child: Text("zhavierah")),
            ),
            Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(255, 178, 73, 162),
              child: Center(child: Text("vierah")),
            )
          ],
        ),
      ),
    );
  }
}