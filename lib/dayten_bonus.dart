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
  // List<int> signalStrengths = [];
  List<List<String>> display = List.generate(6, (_) => []);

//set variables
  int cycles = 0;
  int currentValue = 1;
  int logLevel = 40;
  int listNumber = 0;
  List<int> sprite = [0, 1, 2];

//create a break to move to next line of display
  void checkCycles() {
    if (cycles / logLevel == 1) {
      cycles = 0;
      listNumber = listNumber + 1;
    }
  }

//set the Sprite
  void setSprite() {
    sprite.clear();
    sprite.addAll([currentValue - 1, currentValue, currentValue + 1]);
  }

//determine what gets diplayed on screen . == blank # == lit pixel
  void addToList() {
    if (display[listNumber].length == sprite[0] ||
        display[listNumber].length == sprite[1] ||
        display[listNumber].length == sprite[2]) {
      display[listNumber].add('#');
    } else {
      display[listNumber].add('.');
    }
  }

//process instructions
  for (int i = 0; i <= moves.length - 1; i++) {
    if (moves[i][0] == 'noop') {
      checkCycles();
      addToList();
      cycles = cycles + 1;
      checkCycles();
    }
    if (moves[i][0] == 'addx') {
      checkCycles();
      cycles = cycles + 1;
      addToList();
      checkCycles();
      cycles = cycles + 1;
      currentValue = currentValue + int.parse(moves[i][1]);
      addToList();
      setSprite();
      checkCycles();
    }
  }
  //print result
  for (int z = 0; z <= display.length - 1; z++) {
    print(display[z].join());
  }
}
