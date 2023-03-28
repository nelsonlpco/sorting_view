import 'dart:ui';

Future<void> mergeSort(
    List<int> arr, int left, int right, VoidCallback refresh) async {
  if (left >= right) {
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
  int n1 = middle - left + 1;
  int n2 = right - middle;

  var l = List.filled(n1, 0, growable: false);
  var m = List.filled(n2, 0, growable: false);

  for (var i = 0; i < n1; i++) {
    l[i] = arr[left + i];
  }

  for (var j = 0; j < n2; j++) {
    m[j] = arr[middle + 1 + j];
  }

  int i = 0;
  int j = 0;
  int k = left;

  while (i < n1 && j < n2) {
    if (l[i] <= m[j]) {
      arr[k] = l[i];
      i++;
      await Future.delayed(Duration(milliseconds: 100));
      refresh();
    } else {
      arr[k] = m[j];
      j++;
      await Future.delayed(Duration(milliseconds: 100));
      refresh();
    }
    k++;
  }

  while (i < n1) {
    arr[k] = l[i];
    i++;
    k++;

    await Future.delayed(Duration(milliseconds: 100));
    refresh();
  }

  while (j < n2) {
    arr[k] = m[j];
    j++;
    k++;

    await Future.delayed(Duration(milliseconds: 100));
    refresh();
  }
}
