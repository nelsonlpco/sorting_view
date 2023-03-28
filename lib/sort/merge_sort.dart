import 'package:flutter/material.dart';

Future<void> mergeSort(
    List<int> arr, int left, int right, VoidCallback refresh) async {
  if (left > right) {
    return;
  } else {
    int middle = ((left + right) / 2).truncate();
    await mergeSort(arr, left, middle, refresh);
    await mergeSort(arr, middle + 1, right, refresh);

    await merge(arr, left, middle, right, refresh);
  }
}

Future<void> merge(List<int> arr, int left, int middle, int right,
    VoidCallback refresh) async {
  List<int> helper = [];
  for (int i = left; i <= right; i++) {
    helper[i] = arr[i];
  }

  int i = left;
  int j = middle + 1;
  int k = left;

  while (i <= middle && j <= right) {
    if (helper[i] <= helper[j]) {
      arr[k] = helper[i];
      i++;
      await Future.delayed(Duration(milliseconds: 100));
      refresh();
    } else {
      arr[k] = helper[j];
      j++;
      await Future.delayed(Duration(milliseconds: 100));
      refresh();
    }
    k++;
  }

  while (i <= middle) {
    arr[k] = helper[i];
    i++;
    k++;
    await Future.delayed(Duration(milliseconds: 100));
    refresh();
  }

  while (j <= right) {
    arr[k] = helper[j];
    j++;
    k++;
    await Future.delayed(Duration(milliseconds: 100));
    refresh();
  }
}
