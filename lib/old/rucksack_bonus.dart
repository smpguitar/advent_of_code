import 'dart:io';

challengeOne() {
//get input
  String text = File('/Users/stephenparks/Development/rucksack_data.txt')
      .readAsStringSync();

  // Split the text into lines in a list
  List<String> lines = text.split('\n');

  //variables
  int lineLength = 0;

  //holding variables for Contents of groups of three
  String elfOne = '';
  String elfTwo = '';
  String elfThree = '';

//iterable String of elf contents for groups of three
  List<String> elfOneContents = [];
  List<String> elfTwoContents = [];
  List<String> elfThreeContents = [];

  //holding for finding the common character in the three lists and the priority Value
  int priority = 0;
  String commonCharacter = '';
  int sumOfPriorities = 0;

// priority Map Values
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

//finding the common element in all 3 elves packs
  findCommonElement() {
    for (String item in elfOneContents) {
      if (elfTwoContents.contains(item) && elfThreeContents.contains(item)) {
        commonCharacter = item;
        print(commonCharacter);
      }
    }
  }

//calculate priority value
  calculatePriority() {
    priority = priorityValues[commonCharacter] as int;
    print(priority);
  }

  List<String> findContentsOfRuckSack(elf) {
    List<String> elfContents = [];
    lineLength = elf.length;
    for (int i = 0; i < lineLength; i++) {
      String char = elf[i];

      elfContents.add(char);
    }
    print(elfContents);
    return elfContents;
  }

//group into batches of three
  List<List<String>> groupOfThree(List<String> list) {
    var group = <List<String>>[];
    var i = 0;
    while (i < list.length) {
      group.add(list.skip(i).take(3).toList());
      i += 3;
    }
    return (group);
  }

  //assign each element of group to elf number
  assignToElf(listOfLists) {
    int length = listOfLists.length;

    for (int i = 0; i < length; i++) {
      elfOne = listOfLists[i][0];
      elfTwo = listOfLists[i][1];
      elfThree = listOfLists[i][2];

      elfOneContents = findContentsOfRuckSack(elfOne);
      elfTwoContents = findContentsOfRuckSack(elfTwo);
      elfThreeContents = findContentsOfRuckSack(elfThree);

      findCommonElement();
      calculatePriority();

      //get total of priorities
      sumOfPriorities = sumOfPriorities + priority;
    }
  }

  var literalValues = groupOfThree(lines);
  print(literalValues);
  assignToElf(literalValues);
  print('sum of Priorities: $sumOfPriorities');
}
