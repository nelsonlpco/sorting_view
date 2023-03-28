import 'package:flutter_test/flutter_test.dart';
import 'package:sort_visualizer/sort/quick_sort.dart';

void main() {
  test("order with quick sort", () async {
    var arr = [
      968,
      780,
      655,
      13,
      646,
      741,
      722,
      435,
      787,
      775,
      715,
      247,
      755,
      794,
      810,
      962,
      508,
      733,
      328,
      812
    ];

    await quickSort(arr, 0, arr.length - 1, () {});

    expect(arr, [2, 4, 6, 7, 8, 10, 11, 12, 20, 32, 45, 55]);
  });
}
