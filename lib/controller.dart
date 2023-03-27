import 'dart:async';
import 'dart:math';

import 'package:sort_visualizer/sort/buble_sort.dart';

class Controller {
  var total = 20;
  var rng = Random();
  late List<int> values;
  final StreamController _controller = StreamController<List<int>>();

  Controller() {
    values = List.generate(total, (_) => rng.nextInt(1000)).toList();
    _controller.sink.add(values);
  }

  get stream => _controller.stream;

  void sort() async {
    await BubleSort(this.values, () {
      _controller.sink.add(this.values);
    });
  }

  dispose() {
    _controller.sink.close();
  }
}
