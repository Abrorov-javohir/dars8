void main() {
  List<int> list = [1, 3, 2, 3, 4, 2, 5,1];
  Map elem = {};

  for (int i = 0; i < list.length; i++) {
    int current = list[i];
    if (!elem.containsKey(current)) {
      int count = 0;
      for (int j = 0; j < list.length; j++) {
        if (list[j] == current) {
          count++;
        }
      }
      elem[current] = count;
    }
  }
  print(elem);
  List val = elem.values.toList();
  int curr = val.reduce((curr, next) => curr > next? curr: next);
  int l = elem.keys.firstWhere(
    (k) => elem[k] == curr, orElse: () => 0);
  print(l);
}
