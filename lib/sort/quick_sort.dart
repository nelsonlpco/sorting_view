import 'dart:io';

import 'package:flutter/material.dart';

Future<void> quickSort(
    List<int> arr, int left, int right, VoidCallback refresh) async {
  if (left < right) {
    var index = await lomutoPatition(arr, left, right, refresh);
    await quickSort(arr, left, index - 1, refresh);
    await quickSort(arr, index + 1, right, refresh);
  }
}

Future<int> lomutoPatition(
    List<int> arr, int left, int right, VoidCallback refresh) async {
  int pivot = arr[left];
  int i = left;

  for (int j = left + 1; j <= right; j++) {
    if (arr[j] <= pivot) {
      i++;
      await swap(arr, i, j, refresh);
    }
  }

  await swap(arr, left, i, refresh);

  return i;
}

Future<void> swap(arr, a, b, VoidCallback refresh) async {
  await Future.delayed(Duration(milliseconds: 100));

  var temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
  refresh();
}
