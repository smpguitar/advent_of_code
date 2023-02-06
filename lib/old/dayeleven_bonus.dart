import 'dart:io';
import 'dart:math';

decypher() {
//get input
  String text = File(
          '/Users/stephenparks/Development/advent_of_code/advent_of_code/bin/dayeleven_data.txt')
      .readAsStringSync();

  // Split the text into lines in a list
  // LineSplitter ls = const LineSplitter();
  List<String> lines = text.split(RegExp("\n\n"));
  List<List<String>> monkeyHold = [];
  List<MonkeyModel> monkies = [];
  int rounds = 10000;
  int modulus = 1;

  getMonkeyProperties(item) {
    List<String> properties = item.split(RegExp("\n"));
    monkeyHold.add(properties);

    // print(properties);
  }

  // int relief(value) {
  //   int number = value ~/ 3;
  //   print(number);
  //   return number;
  // }

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
//variables
    List<int> worries = [];
    String worryChange;
    String operation;
    int test;
    int ifTrue;
    int ifFalse;

    //parse worries
    for (int w = 0; w <= worryValue.length - 1; w++) {
      worries.add(int.parse(worryValue[w]));
    }
    //get values for calculating newWorry
    List<String> getValues = monkey[2].split(' ');
    operation = getValues[6];
    worryChange = getValues[7];

    List<String> getTest = monkey[3].split(RegExp(r'[^0-9]+'));
    List<String> getTrue = monkey[4].split(RegExp(r'[^0-9]+'));
    List<String> getFalse = monkey[5].split(RegExp(r'[^0-9]+'));
    test = int.parse(getTest[1]);
    ifTrue = int.parse(getTrue[1]);
    ifFalse = int.parse(getFalse[1]);
    MonkeyModel monkeyModel = MonkeyModel(
        whichMonkey, 0, worries, worryChange, operation, test, ifTrue, ifFalse);
    monkies.add(monkeyModel);
  }

  // ignore: unused_element
  removeUsedValues(monkey, number) {
    monkies[monkey].items.removeRange(0, number);
  }

  calculateRound(number) {
    for (int wor = 0; wor <= monkies[number].items.length - 1; wor++) {
      //startValue

      int oldWorry = monkies[number].items[wor];

      monkies[number].count = monkies[number].count + 1;
      DoMath math = DoMath(
          oldWorry, monkies[number].operation, monkies[number].worryChange);
      oldWorry = math.calculateWorry();
      //add to new monkeylist
      // oldWorry = relief(oldWorry);
      if (tossToMonkey(oldWorry, monkies[number].test) == true) {
        monkies[monkies[number].ifTrue].items.add(oldWorry % modulus);
        print('toss Monkey = true.  Toss To ${monkies[number].ifTrue}');
      }

      if (tossToMonkey(oldWorry, monkies[number].test) == false) {
        monkies[monkies[number].ifFalse].items.add(oldWorry % modulus);
        print('toss Monkey = false. Toss To ${monkies[number].ifFalse}');
      }
    }
    monkies[number].items.removeRange(0, monkies[number].items.length);
    print(
        'monkey 0: ${monkies[0].items}, monkey 1: ${monkies[1].items}, monkey 2: ${monkies[2].items}, monkey 3: ${monkies[3].items}');
  }

  getSolution() {
    List<int> solutionList = [];
    for (int i = 0; i <= monkies.length - 1; i++) {
      solutionList.add(monkies[i].count);
    }
    int maxOne = solutionList.reduce(max);
    print('max one: $maxOne');
    solutionList.remove(maxOne);
    int maxTwo = solutionList.reduce(max);
    print('max Two: $maxTwo');
    int answer = maxOne * maxTwo;
    print('answer: $answer');
  }

// seperate bulk data to individual monkeys
  for (int numMonk = 0; numMonk <= lines.length - 1; numMonk++) {
    getMonkeyProperties(lines[numMonk]);
  }
  //standardize data
  for (int i = 0; i <= monkeyHold.length - 1; i++) {
    parseMonkeyData(monkeyHold[i], i);
  }
  for (int i = 0; i <= monkies.length - 1; i++) {
    modulus = modulus * monkies[i].test;
  }

  for (int repeat = 0; repeat <= rounds - 1; repeat++) {
    for (int m = 0; m <= monkies.length - 1; m++) {
      calculateRound(m);
    }
    print('round $repeat');
  }
  print(
      'monkey 0 count: ${monkies[0].count}, monkey 1 count: ${monkies[1].count}, monkey 2 count: ${monkies[2].count}, monkey 3 count: ${monkies[3].count}');
  print(
      'monkey 0: ${monkies[0].items}, monkey 1: ${monkies[1].items}, monkey 2: ${monkies[2].items}, monkey 3: ${monkies[3].items}');
  //todo get monkey counts and multiply largest two values
  getSolution();
}

class DoMath {
  int oldWorry;
  String operand;
  String mathObject;

  DoMath(this.oldWorry, this.operand, this.mathObject);

  int calculateWorry() {
    int value;
    print('oldWorry = $oldWorry, operand = $operand, value = $mathObject');
    if (mathObject == 'old') {
      value = oldWorry;
    } else {
      value = int.parse(mathObject);
    }
    // value = int.parse(mathObject);
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
    print('new Worry:  $newWorry');
    return newWorry;
  }
}

class MonkeyModel {
  int number;
  int count;
  List<int> items;
  String worryChange;
  String operation;
  int test;
  int ifTrue;
  int ifFalse;

  MonkeyModel(this.number, this.count, this.items, this.worryChange,
      this.operation, this.test, this.ifTrue, this.ifFalse);
}


 
    // String finalValue = ', ${oldWorry.toString()}';

   

    // print(worries);