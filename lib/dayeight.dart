import 'dart:convert';
import 'dart:io';

decypher() {
//get input
  String text = File(
          '/Users/stephenparks/Development/advent_of_code/advent_of_code/bin/day_eight_data.txt')
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

  bool isVisible = false;
  bool amIncrementing = false;

  int totalVisible = 0;
  int additionalVisible = (grid.length * 2) + (lines.length * 2) - 4;

  // create 4 functions isVisibleFromTop/Bottom/Left;Right

  isVisibleFromTop() {
    for (int i = currentRow - 1; i >= 0; i--) {
      print('isVisibleFromTop');
      print('current Row minus 1 in from top: ${currentRow - 1}');
      print(
          'current evaluated item:  row: $i column: $currentColumn  specific value: ${grid[i][currentColumn]}');
      print(
          'comparison item: current row: $currentRow  column: $currentColumn specific value: ${grid[currentRow][currentColumn]}');
      if (grid[currentRow][currentColumn] <= grid[i][currentColumn]) {
        print('will not be visible');
        isVisible = false;
        break;
      }
      if (grid[currentRow][currentColumn] > grid[i][currentColumn]) {
        isVisible = true;

        print('is visible at row $currentRow, column $currentColumn');
      }
    }
    if (isVisible == true) {
      print('incrementing total visible');
      amIncrementing = true;
      totalVisible = totalVisible + 1;
      isVisible == false;
    }
  }

  isVisibleFromBottom() {
    for (int i = lines.length; i > currentRow + 1; i--) {
      print('isVisibleFromBottom');
      print('current Row plus 1: ${currentRow + 1}');
      print(
          'current evaluated item:  row: $i column: $currentColumn  specific value: ${grid[i - 1][currentColumn]}');
      print(
          'comparison item: current row: $currentRow  column: $currentColumn specific value: ${grid[currentRow][currentColumn]}');
      if (grid[currentRow][currentColumn] <= grid[i - 1][currentColumn]) {
        print('will not be visible');
        isVisible = false;
        break;
      }
      if (grid[currentRow][currentColumn] > grid[i - 1][currentColumn]) {
        isVisible = true;

        print('is visible at row $currentRow, column $currentColumn');
      }
    }
    if (isVisible == true) {
      print('incrementing total visible');
      amIncrementing = true;
      totalVisible = totalVisible + 1;
      isVisible == false;
    }
  }

  isVisibleFromRight() {
    for (int i = grid[0].length - 1; i >= currentColumn + 1; i--) {
      print('isVisibleFromRight');
      print('current Column plus 1: ${currentColumn + 1}');
      print(
          'current evaluated item:  row: $currentRow column: $i specific value: ${grid[currentRow][i]}');
      print(
          'comparison item: current row: $currentRow  column: $currentColumn specific value: ${grid[currentRow][currentColumn]}');
      if (grid[currentRow][currentColumn] <= grid[currentRow][i]) {
        print('will not be visible');
        isVisible = false;
        break;
      }
      if (grid[currentRow][currentColumn] > grid[currentRow][i]) {
        isVisible = true;

        print('is visible at row $currentRow, column $currentColumn');
      }
    }
    if (isVisible == true) {
      print(
          '${grid[currentRow][currentColumn]} is visible from right.  incrementing total visible');
      amIncrementing = true;
      totalVisible = totalVisible + 1;
      isVisible == false;
    }
  }

  isVisibleFromLeft() {
    for (int i = 0; i <= currentColumn - 1; i++) {
      print('isVisibleFromLeft');
      print('current Column minus 1: ${currentColumn - 1}');
      print(
          'current evaluated item:  row: $currentRow column: $i specific value: ${grid[currentRow][i]}');
      print(
          'comparison item: current row: $currentRow  column: $currentColumn specific value: ${grid[currentRow][currentColumn]}');
      if (grid[currentRow][currentColumn] <= grid[currentRow][i]) {
        print('will not be visible');
        isVisible = false;
        break;
      }
      if (grid[currentRow][currentColumn] > grid[currentRow][i]) {
        isVisible = true;

        print('is visible at row $currentRow, column $currentColumn');
      }
    }
    if (isVisible == true) {
      print(
          '${grid[currentRow][currentColumn]} is visible from right.  incrementing total visible');
      amIncrementing = true;
      totalVisible = totalVisible + 1;
      isVisible == false;
    }
  }

  for (int row = 1; row < lines.length - 1; row++) {
    currentRow = row;
    // print('row $row: ${lines[row]}');

    for (int column = 1; column < grid[0].length - 1; column++) {
      amIncrementing = false;
      currentColumn = column;
      print('column $column');
      print('current row minus 1:  ${currentRow - 1}');
      print('grid lenth: ${grid[0].length}');
      if (amIncrementing == false) {
        isVisibleFromTop();
      }
      if (amIncrementing == false) {
        isVisibleFromBottom();
      }
      if (amIncrementing == false) {
        isVisibleFromRight();
      }
      if (amIncrementing == false) {
        isVisibleFromLeft();
      }
    }
  }
//function to choose place in list to compare
  print('${grid[0].length}');
  print('inner visible = $totalVisible');
  print('outer visible = $additionalVisible');
  print('total visible = ${additionalVisible + totalVisible}');
//compare values if > add to visible
}
