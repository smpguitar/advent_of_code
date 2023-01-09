import 'dart:io';

challengeOne() {
//get input
  String text = File(
          '/Users/stephenparks/Development/advent_of_code/advent_of_code/bin/cleaning_data.txt')
      .readAsStringSync();

  // Split the text into lines in a list
  List<String> lines = text.split('\n');

  int totalOverlap = 0;

  print(lines);

  for (String line in lines) {
    List<String> items = line.split(RegExp(r'[-,]'));
    print(items);

    int pairOneLow;
    int pairOneHigh;
    int pairTwoLow;
    int pairTwoHigh;

    pairOneLow = int.parse(items[0]);
    pairOneHigh = int.parse(items[1]);
    pairTwoLow = int.parse(items[2]);
    pairTwoHigh = int.parse(items[3]);

    if (pairOneLow >= pairTwoLow && pairOneLow <= pairTwoHigh) {
      totalOverlap = totalOverlap + 1;
      print('true');
    } else if (pairOneHigh >= pairTwoLow && pairOneHigh <= pairTwoHigh) {
      totalOverlap = totalOverlap + 1;
      print('true');
    } else if (pairTwoLow >= pairOneLow && pairTwoLow <= pairOneHigh) {
      totalOverlap = totalOverlap + 1;
    } else if (pairTwoHigh >= pairOneLow && pairTwoHigh <= pairOneHigh) {
      totalOverlap = totalOverlap + 1;
    }
    print('total so far: $totalOverlap');
  }

  print('total cases of fitting entirely in range: $totalOverlap');
}
