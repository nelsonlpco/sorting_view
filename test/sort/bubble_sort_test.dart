import 'package:flutter_test/flutter_test.dart';
import 'package:sort_visualizer/sort/bubble_sort.dart';
import 'package:sort_visualizer/sort/quick_sort.dart';

void main() {
  test("order a array", () async {
    var count = 0;
    var c = () {
      count++;
    };

    var a = [2, 4, 5, 7, 1, 8, 9];
    await bubbleSort(a, c);

    print(a);
    expect(count, 4);
  });
}
