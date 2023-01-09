import 'dart:io';

challengeOne() {
//get input
  String text = File(
          '/Users/stephenparks/Development/advent_of_code/advent_of_code/bin/cleaning_data.txt')
      .readAsStringSync();

  // Split the text into lines in a list
  List<String> lines = text.split('\n');

  int totalEnvelopment = 0;

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

    if (pairTwoHigh <= pairOneHigh && pairTwoLow >= pairOneLow) {
      totalEnvelopment = totalEnvelopment + 1;
      print('true');
    } else if (pairOneHigh <= pairTwoHigh && pairOneLow >= pairTwoLow) {
      totalEnvelopment = totalEnvelopment + 1;
      print('true');
    }
    print('total so far: $totalEnvelopment');
  }

  print('total cases of fitting entirely in range: $totalEnvelopment');
}
