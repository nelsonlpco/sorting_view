import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sort_visualizer/controller.dart';
import 'package:sort_visualizer/sort/buble_sort.dart';
import 'package:sort_visualizer/sort/quick_sort.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorting view',
      debugShowCheckedModeBanner: false,
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
  var ctr = Controller();

  @override
  void dispose() {
    ctr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Bubble-Sort',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<List<int>>(
                stream: ctr.stream,
                builder: (context, snapshot) {
                  var values = snapshot.data;

                  if (values == null) {
                    return Text("Empty");
                  }

                  if (values != null && values.isEmpty) {
                    return Text("Empty");
                  }

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: values!
                            .map<Widget>(
                              (v) => Container(
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                ),
                                height: v * 0.2,
                                width: MediaQuery.of(context).size.height *
                                    0.5 /
                                    ctr.total,
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      // Text(
                      //   "$values",
                      //   style: const TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ],
                  );
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    ctr.sort();
                  },
                  child: const Text("Sort"))
            ],
          ),
        ),
      ),
    );
  }
}
