import 'package:flutter/material.dart';

Future<void> heapSort(List<int> arr, int n, VoidCallback refresh) async {
  int i = (n / 2).truncate(), pai, filho, t;

  while (true) {
    if (i > 0) {
      i--;
      t = arr[i];
    } else {
      n--;
      if (n <= 0) return;

      t = arr[n];
      arr[n] = arr[0];
      await Future.delayed(Duration(milliseconds: 100));
      refresh();
    }

    pai = i;
    filho = i * 2 + 1;
    while (filho < n) {
      if ((filho + 1 < n) && (arr[filho + 1] > arr[filho])) {
        filho++;
      }

      if (arr[filho] > t) {
        arr[pai] = arr[filho];
        pai = filho;
        filho = pai * 2 + 1;
        await Future.delayed(Duration(milliseconds: 100));
        refresh();
      } else {
        break;
      }
    }

    arr[pai] = t;
    await Future.delayed(Duration(milliseconds: 100));
    refresh();
  }
}
