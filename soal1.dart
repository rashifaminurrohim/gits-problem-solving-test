String solution1(int n) {
  List<int> series = [];
  for (int i = 0; i < n; i++) {
    int item = (i * (i + 1)) ~/ 2 + 1;
    series.add(item);
  }
  return series.join("-");
}

void main() {
  print("input 1: ${solution1(1)}");
  print("input 7: ${solution1(7)}");
  print("input 10: ${solution1(10)}");
}
