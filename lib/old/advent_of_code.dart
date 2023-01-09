import 'dart:io';

readData() async {
// Read the contents of a file
  String text =
      File('/Users/stephenparks/Development/data.txt').readAsStringSync();

  // Split the text into lines
  List<String> lines = text.split('\n');

  // Initialize variables to keep track of the Elf with the highest total and their total
  int highestTotal = 0;
  int secondElfTotal = 0;
  int thirdElfTotal = 0;
  int highestElf = 0;
  int secondElf = 0;
  int thirdElf = 0;
  int currentElf = 1;
  int currentTotal = 0;
  int topThreeTotal = 0;

  // Iterate through the lines
  for (String line in lines) {
    print('current elf is $currentElf.  current total is $currentTotal');
    if (line.isEmpty) {
      // If the line is empty, we're starting a new Elf's inventory
      currentElf++;
      currentTotal = 0;
    } else {
      // Parse the line as an integer and add it to the current Elf's total
      int calories = int.parse(line);
      currentTotal += calories;

      //if current is third
      if (currentTotal > thirdElfTotal && currentTotal < secondElfTotal) {
        thirdElf = currentElf;
        thirdElfTotal = currentTotal;

        topThreeTotal = highestTotal + secondElfTotal + thirdElfTotal;
      }

      //if current is higher than 2nd, but not highest.
      if (currentTotal > secondElfTotal && currentTotal < highestTotal) {
        thirdElf = secondElf;
        thirdElfTotal = secondElfTotal;
        secondElf = currentElf;
        secondElfTotal = currentTotal;

        topThreeTotal = highestTotal + secondElfTotal + thirdElfTotal;
      }

      // If the current Elf's total is higher than the highest total so far, update the highest total and Elf
      if (currentTotal > highestTotal) {
        if (currentElf == highestElf) {
          highestElf = currentElf;
          highestTotal = currentTotal;

          topThreeTotal = highestTotal + secondElfTotal + thirdElfTotal;
        } else {
          //make second -> third
          thirdElf = secondElf;
          thirdElfTotal = secondElfTotal;
          //make highest -> second
          secondElf = highestElf;
          secondElfTotal = highestTotal;
          //make current -> highest
          highestElf = currentElf;
          highestTotal = currentTotal;
          //sum top 3
          topThreeTotal = highestTotal + secondElfTotal + thirdElfTotal;
        }
      }
    }
  }

  print(
      'Elf $highestElf is carrying the most Calories, with a total of $highestTotal.  Elf $secondElf was second at $secondElfTotal. Elf $thirdElf at $thirdElfTotal.  Elf $highestElf, $secondElf, and $thirdElf have a combined total of $topThreeTotal');
}
