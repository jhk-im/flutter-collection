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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomPage(),
    );
  }
}

class MyHomPage extends StatefulWidget {
  const MyHomPage({Key? key}) : super(key: key);

  @override
  State<MyHomPage> createState() => _MyHomPageState();
}

class _MyHomPageState extends State<MyHomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
    );
  }
}
