import 'dart:async';
import 'dart:math';

import 'package:sort_visualizer/sort/bubble_sort.dart';
import 'package:sort_visualizer/sort/heap_sort.dart';
import 'package:sort_visualizer/sort/merge_sort.dart';
import 'package:sort_visualizer/sort/quick_sort.dart';

class Controller {
  var total = 40;
  var rng = Random();
  late List<int> values;

  final _controller = StreamController<List<int>>();
  final _bubbleSortController = StreamController<List<int>>();
  final _heapSortController = StreamController<List<int>>();
  final _mergeSortController = StreamController<List<int>>();

  final _doneStreamController = StreamController<bool>();

  Controller() {
    randomize();
  }

  get stream => _controller.stream;
  get bubbleSortStream => _bubbleSortController.stream;
  get heapSortStream => _heapSortController.stream;
  get mergeSortStream => _mergeSortController.stream;
  get doneStream => _doneStreamController.stream;

  void randomize() {
    values = List.generate(total, (_) => rng.nextInt(1000)).toList();
    _controller.sink.add(values);
    _bubbleSortController.sink.add(values);
    _heapSortController.sink.add(values);
    _mergeSortController.sink.add(values);
    _doneStreamController.sink.add(true);
  }

  Future<void> startBubbleSort() async {
    var v = List<int>.from(values).toList();
    await bubbleSort(v, () {
      _bubbleSortController.sink.add(v);
    });
  }

  Future<void> startQuickSort() async {
    var v = List<int>.from(values).toList();
    await quickSort(v, 0, values.length - 1, () {
      _controller.sink.add(v);
    });
  }

  Future<void> startHeapSort() async {
    var v = List<int>.from(values).toList();
    await heapSort(v, v.length, () {
      _heapSortController.sink.add(v);
    });
  }

  Future<void> startMergeSort() async {
    var v = List<int>.from(values).toList();
    await mergeSort(v, 0, v.length - 1, () {
      _mergeSortController.sink.add(v);
    });
  }

  Future<void> start() async {
    _doneStreamController.sink.add(false);
    await Future.wait([
      startMergeSort(),
      startHeapSort(),
      startBubbleSort(),
      startQuickSort(),
    ]);

    _doneStreamController.sink.add(true);
  }

  dispose() {
    _controller.sink.close();
    _bubbleSortController.sink.close();
    _heapSortController.sink.close();
    _mergeSortController.sink.close();
    _doneStreamController.sink.close();
  }
}
