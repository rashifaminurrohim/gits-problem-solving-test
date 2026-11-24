String solution1(int input) {
  List<int> series = [];
  var item = 1;
  var adder = 1;

  for (int i = 1; i <= input; i++) {
    series.add(item);
    item = item + adder;
    adder++;
  }
  return series.join("-");
}

void main() {
  print(solution1(1));
  print(solution1(7));
  print(solution1(10));
}
