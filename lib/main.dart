import 'package:flutter/material.dart';
import 'package:flutter_design_pattern_example/adapter_pattern.dart';

import 'factory_pattern.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  void onTap() {
    /// factory pattern
    final user1 = PlayFactory(PlayType.cricket);
    user1.playTime();
    final user2 = PlayFactory(PlayType.football);
    user2.playTime();
    final user3 = PlayFactory(PlayType.tableTennis);
    user3.playTime();

    /// adapter pattern

    // final students = StudentInformation().getStudentInformation();
    // for (var item in students) {
    //   print(
    //       '${item.studentName}\n${item.schoolPassingYear}\n${item.background}');
    //   print('-----------');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('factory pattern'),
          ElevatedButton(
              onPressed: () {
                onTap();
              },
              child: const Text('pressed')),
        ],
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
