import 'dart:convert';
import 'dart:io';

decypher() {
//get input
  String text = File(
          '/Users/stephenparks/Development/advent_of_code/advent_of_code/bin/day_eight_test_data.txt')
      .readAsStringSync();

  // Split the text into lines in a list
  LineSplitter ls = const LineSplitter();

  List<String> lines = ls.convert(text);
  print(lines);

//create dynamic lists for every row
  List<List<int>> grid = lines
      .map((row) => row.split("").map((char) => int.parse(char)).toList())
      .toList();

  print(grid);
  print('grid length: ${grid.length}');

//function to choose place in list to compare

//start on row 2, tree 2

//create List to compare vertical -- From Row 0 to current list -1

//create List to compare Horizontal -- All items but current selection

//compare values if > add to visible
}
