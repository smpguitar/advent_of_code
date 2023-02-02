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
  List<int> monkeyCounts = [];
  int rounds = 20;

  getMonkeyProperties(item) {
    List<String> properties = item.split(RegExp("\n"));
    monkeys.add(properties);

    print(properties);
  }

  int relief(value) {
    int number = value ~/ 3;
    return number;
  }

  bool tossToMonkey(value, testNumber) {
    bool ab;
    if (value % testNumber == 0) {
      ab = true;
    } else {
      ab = false;
    }
    return ab;
  }

  parseMonkeyData(monkey, whichMonkey) {
    List<String> worry = monkey[1].split(RegExp('Starting items: '));
    var worryValue = worry[1].split(RegExp(r'[^0-9]+'));
    List<int> worries = [];

    // print(worry);

    for (int w = 0; w <= worryValue.length - 1; w++) {
      // print(worryValue);
      worries.add(int.parse(worryValue[w]));
      // monkeyCounts[whichMonkey] = monkeyCounts[whichMonkey] + 1;
      //get values for calculating newWorry
      // List<String> getValues = monkey[2].split(' ');
      // print('getValues: $getValues');
      // int oldWorry = int.parse(worryValue[w]);
      // DoMath math = DoMath(oldWorry, getValues[6], int.parse(getValues[7]));
      // oldWorry = math.calculateWorry();
      //do division
      // relief(oldWorry);
      //do test
      // List<String> getTest = monkey[3].split(RegExp(r'[^0-9]+'));
      // List<String> getTrue = monkey[4].split(RegExp(r'[^0-9]+'));
      // List<String> getFalse = monkey[5].split(RegExp(r'[^0-9]+'));
      // print('monkey 5 = ${monkey[4]}, monkey 6 = ${monkey[5]}');
      // int test = int.parse(getTest[1]);
      // int ifTrue = int.parse(getTrue[1]);
      // int ifFalse = int.parse(getFalse[1]);
      // print('test = $test, ifTrue = $ifTrue, ifFalse = $ifFalse');
      // String finalValue = ', ${oldWorry.toString()}';

      //add to new monkeylist
      // if (tossToMonkey(oldWorry, test) == true) {
      //   monkeys[ifTrue][1] += (finalValue);
      // }
      // if (tossToMonkey(oldWorry, test) == false) {
      //   monkeys[ifFalse][1] += (finalValue);
      // }
    }
    print(worries);
  }

// seperate bulk data to individual monkeys
  for (int i = 0; i <= lines.length - 1; i++) {
    getMonkeyProperties(lines[i]);
    int count = 0;
    monkeyCounts.add(count);
  }
  for (int j = 0; j <= rounds - 1; j++) {
    for (int numMonk = 0; numMonk <= monkeyCounts.length - 1; numMonk++) {
      parseMonkeyData(monkeys[numMonk], j);
    }
  }
  // print('monkey Counts = $monkeyCounts');
  print(monkeys);
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
    //relief
    return newWorry;
  }
}

class MonkeyModel {
  int number;
  List<int> items;
  String operation;
  int test;
  int ifTrue;
  int ifFalse;

  MonkeyModel(this.number, this.items, this.operation, this.test, this.ifTrue,
      this.ifFalse);
}
