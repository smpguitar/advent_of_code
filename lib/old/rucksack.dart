import 'dart:io';

challengeOne() {
//get input
  String text = File('/Users/stephenparks/Development/rucksack_data.txt')
      .readAsStringSync();

  // Split the text into lines
  List<String> lines = text.split('\n');
//split in half each entry
//count total number of characters in string
//half of string value
  int lineLength = 0;
  double halfLengthDouble = 0;
  int halfLength = 0;
  String firstHalf = '';
  String secondHalf = '';
  String commonCharacter = '';
  List<String> firstHalfList = [];
  List<String> secondHalfList = [];
  // int firstHalfLength = 0;
  int ruckSackNumber = 0;
  int priority = 0;
  int priorityTotal = 0;

  Map<String, int> priorityValues = {
    'a': 1,
    'b': 2,
    'c': 3,
    'd': 4,
    'e': 5,
    'f': 6,
    'g': 7,
    'h': 8,
    'i': 9,
    'j': 10,
    'k': 11,
    'l': 12,
    'm': 13,
    'n': 14,
    'o': 15,
    'p': 16,
    'q': 17,
    'r': 18,
    's': 19,
    't': 20,
    'u': 21,
    'v': 22,
    'w': 23,
    'x': 24,
    'y': 25,
    'z': 26,
    'A': 27,
    'B': 28,
    'C': 29,
    'D': 30,
    'E': 31,
    'F': 32,
    'G': 33,
    'H': 34,
    'I': 35,
    'J': 36,
    'K': 37,
    'L': 38,
    'M': 39,
    'N': 40,
    'O': 41,
    'P': 42,
    'Q': 43,
    'R': 44,
    'S': 45,
    'T': 46,
    'U': 47,
    'V': 48,
    'W': 49,
    'X': 50,
    'Y': 51,
    'Z': 52
  };

  firstHalfElements() {
    for (int i = 0; i < halfLength; i++) {
      String char = firstHalf[i];

      firstHalfList.add(char);
      // print(char);
    }
  }

  secondHalfElements() {
    for (int i = 0; i < halfLength; i++) {
      String char = secondHalf[i];

      secondHalfList.add(char);
      // print(char);
    }
  }

  findCommonElement() {
    for (String item in firstHalfList) {
      if (secondHalfList.contains(item)) {
        commonCharacter = item;
      }
    }
  }

  calculatePriority() {
    priority = priorityValues[commonCharacter] as int;
  }

//code for puzzle
  for (String line in lines) {
    lineLength = line.length;
    halfLengthDouble = lineLength / 2;
    halfLength = halfLengthDouble.toInt();
    firstHalf = line.substring(0, halfLength);
    secondHalf = line.substring(halfLength, lineLength);
    firstHalfList = [];
    secondHalfList = [];

    print('ruck sack: $ruckSackNumber');
    firstHalfElements();
    secondHalfElements();
    findCommonElement();
    calculatePriority();
    priorityTotal = priorityTotal + priority;

    print('first half list:  $firstHalfList');
    print('second half list: $secondHalfList');
    print('common Character is: $commonCharacter');
    print('priority is: $priority');
    print('priority total = $priorityTotal');
    ruckSackNumber = ruckSackNumber + 1;
  }

//find the common character between the two strings
}


//calculate priority

