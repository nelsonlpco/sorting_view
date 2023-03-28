import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sort_visualizer/controller.dart';
import 'package:sort_visualizer/sort/bubble_sort.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              ctr.startBubbleSort();
              ctr.startQuickSort();
            },
            child: Text("Sort"),
          ),
          const SizedBox(
            height: 22,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DataViwer(
                ctr: ctr,
                title: "Bubble-Sort",
                stream: ctr.bubbleSortStream,
              ),
              const SizedBox(
                width: 18,
              ),
              DataViwer(
                ctr: ctr,
                title: "Quick-Sort",
                stream: ctr.stream,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DataViwer extends StatelessWidget {
  const DataViwer({
    Key? key,
    required this.ctr,
    required this.title,
    required this.stream,
  }) : super(key: key);

  final Controller ctr;
  final String title;
  final Stream<List<int>> stream;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue[50],
        ),
        height: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<List<int>>(
              stream: stream,
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
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
