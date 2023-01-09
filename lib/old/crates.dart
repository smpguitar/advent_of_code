import 'dart:io';

challengeOne() {
//get input
  String text = File(
          '/Users/stephenparks/Development/advent_of_code/advent_of_code/bin/crates_data.txt')
      .readAsStringSync();

  // Split the text into lines in a list
  List<String> lines = text.split('\n');

  List<String> stackOne = ['Z', 'V', 'T', 'B', 'J', 'G', 'R'];
  List<String> stackTwo = ['L', 'V', 'R', 'J'];
  List<String> stackThree = ['F', 'Q', 'S'];
  List<String> stackFour = ['G', 'Q', 'V', 'F', 'L', 'N', 'H', 'Z'];
  List<String> stackFive = ['W', 'M', 'S', 'C', 'J', 'T', 'Q', 'R'];
  List<String> stackSix = ['F', 'H', 'C', 'T', 'W', 'S'];
  List<String> stackSeven = ['J', 'N', 'F', 'V', 'C', 'Z', 'D'];
  List<String> stackEight = ['Q', 'F', 'R', 'W', 'D', 'Z', 'G', 'L'];
  List<String> stackNine = ['P', 'V', 'W', 'B', 'J'];
  List<String> firstItemOfEach = [];
  int rounds = 0;

  whichStack(value) {
    if (value == '1') {
      return stackOne;
    }
    if (value == '2') {
      return stackTwo;
    }
    if (value == '3') {
      return stackThree;
    }
    if (value == '4') {
      return stackFour;
    }
    if (value == '5') {
      return stackFive;
    }
    if (value == '6') {
      return stackSix;
    }
    if (value == '7') {
      return stackSeven;
    }
    if (value == '8') {
      return stackEight;
    }
    if (value == '9') {
      return stackNine;
    }
  }

  putInstructionsInList(line) {
    print(line.length);
    List<String> instructions = [];
    if (line.length == 3) {
      for (int i = 0; i < line.length; i++) {
        String char = line[i];

        instructions.add(char);
      }
      // print(char);
    } else {
      List<String> hold = [];
      for (int i = 0; i < line.length; i++) {
        String char = line[i];

        hold.add(char);
      }
      List<String> firstNumList = hold.sublist(0, 2);
      String firstNum = firstNumList.join();
      print(firstNum);
      instructions = [firstNum, hold[2], hold[3]];
    }
    return instructions;
  }

  moveCrates(list) {
    print(list);
    String number = list[0];
    int count = int.parse(number);
    String from = list[1];
    String to = list[2];

    var stackFrom = whichStack(from);
    var stackTo = whichStack(to);

    print(stackFrom);

    for (int i = 0; i < count; i++) {
      stackTo?.insert(0, stackFrom!.first);
      stackFrom!.removeAt(0);
    }
  }

  addToFirstItemOfEach() {
    firstItemOfEach = [
      stackOne[0],
      stackTwo[0],
      stackThree[0],
      stackFour[0],
      stackFive[0],
      stackSix[0],
      stackSeven[0],
      stackEight[0],
      stackNine[0]
    ];
  }

  for (String line in lines) {
    // String simplified = line.replaceAll(' ', '');
    RegExp exp = RegExp('\\D');
    String instruction = line.replaceAll(exp, '');

    // String instruction = line.replaceAll(RegExp('[^0-9]'), '');
    List<String> steps = putInstructionsInList(instruction);
    // print(line);
    // String item = steps[0];
    print(line.length);
    // print(simplified);
    print('instructions: $steps]');
    // print('steps: $steps');
    moveCrates(steps);
    print(rounds);
    rounds = rounds + 1;
  }
  addToFirstItemOfEach();
  print('state of stacks is: $firstItemOfEach');
}
