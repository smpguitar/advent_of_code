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
  // print(lines);

//create dynamic lists for every row
  List<List<int>> grid = lines
      .map((row) => row.split("").map((char) => int.parse(char)).toList())
      .toList();

  // print(grid);
  // print('grid length: ${grid.length}');

  int currentRow = 1;
  int currentColumn = 1;
  int fromTop = 0;
  int fromBottom = grid.length;
  int fromLeft = 0;
  int fromRight = lines.length;

  bool isVisible = false;

  int totalVisible = 0;
  int additionaVisible = (grid.length * 2) + (lines.length * 2);

  // print('from Right: $fromRight');
  // print('grid one: ${grid[1][1]}');

  // create 4 functions isVisibleFromTop/Bottom/Left;Right

  isVisibleFromTop() {
    for (int i = currentRow - 1; i == 0; i--) {
      print(
          'current evaluated item:  row: $i column: $currentColumn  specific value: ${grid[i][currentColumn]}');
      print(
          'comparison item: current row: $currentRow  column: $currentColumn specific value: ${grid[currentRow][currentColumn]}');
      if (grid[currentRow][currentColumn] > grid[i][currentColumn]) {
        isVisible = true;
        totalVisible = totalVisible + 1;
        print('is visible at row $currentRow, column $currentColumn');
        isVisible = false;
        // break;
      }
    }
  }

  for (int row = 1; row < grid.length; row++) {
    currentRow = row;
    print('row $row: ${lines[row]}');
    isVisibleFromTop();
    print('total visible = $totalVisible');
    // for (int column = 1; column < grid.length; column++) {
    //   currentColumn = column;
    //   print('column $column');
    //   isVisibleFromTop();
    // }
  }
//function to choose place in list to compare

//compare values if > add to visible
}
