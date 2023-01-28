import 'dart:convert';
import 'dart:io';

decypher() {
//get input
  String text = File(
          '/Users/stephenparks/Development/advent_of_code/advent_of_code/bin/dayten_data.txt')
      .readAsStringSync();

  // Split the text into lines in a list
  LineSplitter ls = const LineSplitter();
  List<String> lines = ls.convert(text);
  List<List<String>> moves =
      lines.map((row) => row.split(" ").toList()).toList();
  List<int> signalStrengths = [];
  int cycles = 0;
  int currentValue = 1;
  int logLevel = 20;

  void logSignalStrength() {
    signalStrengths.add(currentValue * cycles);
  }

  void checkCycles() {
    if (cycles / logLevel == 1) {
      logSignalStrength();
      logLevel = logLevel + 40;
    }
  }

  for (int i = 0; i <= moves.length - 1; i++) {
    if (moves[i][0] == 'noop') {
      checkCycles();
      cycles = cycles + 1;
      checkCycles();
    }
    if (moves[i][0] == 'addx') {
      checkCycles();
      cycles = cycles + 1;
      checkCycles();
      cycles = cycles + 1;
      checkCycles();
      currentValue = currentValue + int.parse(moves[i][1]);
    }
  }
  int result = signalStrengths.fold(0, (k, l) => k + l);
  print(result);
}
