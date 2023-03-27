import 'dart:io';

import 'package:flutter/material.dart';

Future<void> quickSort(List<int> arr, start, end, VoidCallback refresh) async {
  if (start >= end) {
    return;
  }

  var index = await partition(arr, start, end, refresh);
  quickSort(arr, start, index - 1, refresh);
  quickSort(arr, index + 1, end, refresh);
}

Future<int> partition(List<int> arr, start, end, VoidCallback refresh) async {
  var pivotIndex = 0;
  var pivotValue = arr[end];

  for (var i = 0; i < end - 1; i++) {
    if (arr[i] < pivotValue) {
      await swap(i, pivotIndex, pivotValue, refresh);
      pivotIndex++;
    }
  }

  await swap(arr, pivotIndex, end, refresh);

  return pivotIndex;
}

Future<void> swap(arr, a, b, VoidCallback refresh) async {
  // sleep(Duration(milliseconds: 1));
  var temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}
