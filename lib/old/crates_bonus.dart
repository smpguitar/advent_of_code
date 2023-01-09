import 'dart:io';

crate() {
//get input
  String text = File(
          '/Users/stephenparks/Development/advent_of_code/advent_of_code/bin/crates_data.txt')
      .readAsStringSync();

  // Split the text into lines in a list
  List<String> lines = text.split('\n');

  // List<String> stackOne = ['N', 'Z'];
  // List<String> stackTwo = ['D', 'C', 'M'];
  // List<String> stackThree = ['P'];

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
      instructions = [firstNum, hold[2], hold[3]];
    }
    return instructions;
  }

  // moveCrate(count, stackTo, stackFrom) {
  //   for (int i = 0; i < count; i++) {
  //     print('starting crate moves');
  //     print('stack To: $stackTo');
  //     print('stack From: $stackFrom');
  //     print('count of items: $count');

  //     stackTo?.insertAll(0, stackFrom!.take(count));
  //     stackFrom!.removeRange(0, count);

  //     print('stack To after: $stackTo');
  //     print('stack From: $stackFrom');
  //   }
  // }

  moveCrates(list) {
    print('list Length: $list');
    String number = list[0];
    int count = int.parse(number);
    String from = list[1];
    String to = list[2];

    var stackFrom = whichStack(from);
    var stackTo = whichStack(to);

    print('stack moving from: $stackFrom');
    print('stack moving to: $stackTo');
    stackTo?.insertAll(0, stackFrom!.take(count));
    stackFrom?.removeRange(0, count);

    print('stack moving from: $stackFrom');
    print('stack moving to: $stackTo');
  }

//determines final order
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
    print('instructions: $steps]');

    moveCrates(steps);

    print('rounds: $rounds');
    rounds = rounds + 1;
  }
  addToFirstItemOfEach();
  print('state of stacks is: $firstItemOfEach');
}
