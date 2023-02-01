import 'dart:io';

decypher() {
//get input
  String text = File(
          '/Users/stephenparks/Development/advent_of_code/advent_of_code/bin/dayeleven_test_data.txt')
      .readAsStringSync();

  // Split the text into lines in a list
  // LineSplitter ls = const LineSplitter();
  List<String> lines = text.split(RegExp("\n\n"));
  List<List<String>> monkeys = [];

  getMonkeyProperties(item) {
    List<String> properties = item.split(RegExp("\n"));
    monkeys.add(properties);

    // print(properties[0]);
  }

  parseMonkeyData(monkey) {
    List<String> worry = monkey[1].split(RegExp('Starting items: '));
    var worryValue = worry[1].split(RegExp(r'[^0-9]+'));
    // print(worry);

    for (int w = 0; w <= worryValue.length - 1; w++) {
      print(worryValue);
      //get values for calculating newWorry
      List<String> getValues = monkey[2].split(' ');
      int oldWorry = int.parse(worryValue[w]);
      DoMath math = DoMath(oldWorry, getValues[6], int.parse(getValues[7]));
      oldWorry = math.calculateWorry();
      print(oldWorry);
      //do division

      //do test

      //add to new monkeylist
    }
    // print('worry: $worry');
  }

  for (int i = 0; i <= lines.length - 1; i++) {
    getMonkeyProperties(lines[i]);
  }
  parseMonkeyData(monkeys[0]);
  // print(monkeys);
}

class DoMath {
  int oldWorry;
  String operand;
  int value;

  DoMath(this.oldWorry, this.operand, this.value);

  int calculateWorry() {
    print('oldWorry = $oldWorry, operand = $operand, value = $value');
    int newWorry = 0;
    if (operand == '+' || operand == 'add') {
      newWorry = oldWorry + value;
    }
    if (operand == '*' || operand == 'divide') {
      newWorry = oldWorry * value;
    }
    if (operand == '-' || operand == 'minus') {
      newWorry = oldWorry - value;
    }
    if (operand == '/' || operand == 'divisable') {
      newWorry = oldWorry ~/ value;
    }
    return newWorry;
  }
}
