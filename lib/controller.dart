import 'dart:async';
import 'dart:math';

import 'package:sort_visualizer/sort/bubble_sort.dart';
import 'package:sort_visualizer/sort/quick_sort.dart';

class Controller {
  var total = 40;
  var rng = Random();
  late List<int> values;

  final _controller = StreamController<List<int>>();
  final _bubbleSortController = StreamController<List<int>>();

  Controller() {
    randomize();
  }

  get stream => _controller.stream;
  get bubbleSortStream => _bubbleSortController.stream;

  void randomize() {
    values = List.generate(total, (_) => rng.nextInt(1000)).toList();
    _controller.sink.add(values);
    _bubbleSortController.sink.add(values);
  }

  Future<void> startBubbleSort() async {
    var v = List<int>.from(values).toList();
    await bubbleSort(v, () {
      _bubbleSortController.sink.add(v);
    });
  }

  void startQuickSort() async {
    var v = List<int>.from(values).toList();
    await quickSort(v, 0, values.length - 1, () {
      _controller.sink.add(v);
    });
  }

  dispose() {
    _controller.sink.close();
    _bubbleSortController.sink.close();
  }
}
