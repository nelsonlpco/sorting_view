import 'dart:io';

import 'package:flutter/material.dart';

Future<void> BubleSort(List<int> arr, VoidCallback refresh) async {
  for (var x = 0; x < arr.length; x++) {
    for (var y = x + 1; y < arr.length; y++) {
      if (arr[x] > arr[y]) {
        await swap(arr, x, y, refresh);
      }
    }
  }
}

Future<void> swap(List<int> arr, start, end, VoidCallback refresh) async {
  await Future.delayed(Duration(milliseconds: 500));

  var temp = arr[start];
  arr[start] = arr[end];
  arr[end] = temp;

  refresh();
}
