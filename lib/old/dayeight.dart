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

  int totalVisible = 0;
  int additionalVisible = (grid.length * 2) + (lines.length * 2) - 4;

  int topScore = 0;
  int bottomScore = 0;
  int rightScore = 0;
  int leftScore = 0;

  int maxScore = 0;

  // create 4 functions isVisibleFromTop/Bottom/Left;Right

  isVisibleFromTop() {
    int treeDistance = 0;
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
        treeDistance = treeDistance + 1;
        print('top tree distance: $treeDistance');
        topScore = treeDistance;

        break;
      }
      if (grid[currentRow][currentColumn] > grid[i][currentColumn]) {
        isVisible = true;
        treeDistance = treeDistance + 1;
        topScore = treeDistance;
        print('top tree distance: $treeDistance');
        print('is visible at row $currentRow, column $currentColumn');
      }
    }
    if (isVisible == true) {
      print('incrementing total visible');
      totalVisible = totalVisible + 1;
      print('tree distance: $treeDistance');
      isVisible == false;
    }
  }

  isVisibleFromBottom() {
    int treeDistance = 0;
    for (int i = currentRow + 1; i <= lines.length - 1; i++) {
      print('isVisibleFromBottom');
      print('current Row plus 1: ${currentRow + 1}');
      print(
          'current evaluated item:  row: $i column: $currentColumn  specific value: ${grid[i][currentColumn]}');
      print(
          'comparison item: current row: $currentRow  column: $currentColumn specific value: ${grid[currentRow][currentColumn]}');
      if (grid[currentRow][currentColumn] <= grid[i][currentColumn]) {
        print('will not be visible');
        isVisible = false;
        treeDistance = treeDistance + 1;
        print('bottom tree distance: $treeDistance');
        bottomScore = treeDistance;
        break;
      }
      if (grid[currentRow][currentColumn] > grid[i][currentColumn]) {
        isVisible = true;
        treeDistance = treeDistance + 1;
        bottomScore = treeDistance;
        print('bottom tree distance: $treeDistance');
        print('is visible at row $currentRow, column $currentColumn');
      }
    }
    if (isVisible == true) {
      print('incrementing total visible');
      totalVisible = totalVisible + 1;
      print('bottom tree distance: $treeDistance');
      isVisible == false;
    }
  }

  isVisibleFromRight() {
    int treeDistance = 0;
    for (int i = currentColumn + 1; i <= grid[0].length - 1; i++) {
      print('isVisibleFromRight');
      print('current Column plus 1: ${currentColumn + 1}');
      print(
          'current evaluated item:  row: $currentRow column: $i specific value: ${grid[currentRow][i]}');
      print(
          'comparison item: current row: $currentRow  column: $currentColumn specific value: ${grid[currentRow][currentColumn]}');
      if (grid[currentRow][currentColumn] <= grid[currentRow][i]) {
        print('will not be visible');
        treeDistance = treeDistance + 1;
        rightScore = treeDistance;
        print('right tree distance: $treeDistance');
        isVisible = false;
        break;
      }
      if (grid[currentRow][currentColumn] > grid[currentRow][i]) {
        isVisible = true;
        treeDistance = treeDistance + 1;
        rightScore = treeDistance;
        print('right tree distance: $treeDistance');
        print('is visible at row $currentRow, column $currentColumn');
      }
    }
    if (isVisible == true) {
      print(
          '${grid[currentRow][currentColumn]} is visible from right.  incrementing total visible');
      totalVisible = totalVisible + 1;
      print('right tree distance: $treeDistance');
      isVisible == false;
    }
  }

  isVisibleFromLeft() {
    int treeDistance = 0;
    for (int i = currentColumn - 1; i >= 0; i--) {
      print('isVisibleFromLeft');
      print('current Column minus 1: $i');
      print(
          'current evaluated item:  row: $currentRow column: $i specific value: ${grid[currentRow][i]}');
      print(
          'comparison item: current row: $currentRow  column: $currentColumn specific value: ${grid[currentRow][currentColumn]}');
      if (grid[currentRow][currentColumn] <= grid[currentRow][i]) {
        print('will not be visible');
        treeDistance = treeDistance + 1;
        leftScore = treeDistance;
        print('left tree distance: $treeDistance');
        isVisible = false;
        break;
      }
      if (grid[currentRow][currentColumn] > grid[currentRow][i]) {
        isVisible = true;
        treeDistance = treeDistance + 1;
        leftScore = treeDistance;
        print('left tree distance: $treeDistance');
        print('is visible at row $currentRow, column $currentColumn');
      }
    }
    if (isVisible == true) {
      print(
          '${grid[currentRow][currentColumn]} is visible from left.  incrementing total visible');
      totalVisible = totalVisible + 1;
      print('left tree distance: $treeDistance');
      isVisible == false;
    }
  }

  for (int row = 1; row < lines.length - 1; row++) {
    currentRow = row;
    // print('row $row: ${lines[row]}');

    for (int column = 1; column < grid[0].length - 1; column++) {
      currentColumn = column;
      print('column $column');
      print('current row minus 1:  ${currentRow - 1}');
      print('grid lenth: ${grid[0].length}');

      topScore = 0;
      bottomScore = 0;
      rightScore = 0;
      leftScore = 0;

      // if (amIncrementing == false) {
      //   isVisibleFromTop();
      // }
      // if (amIncrementing == false) {
      //   isVisibleFromBottom();
      // }
      // if (amIncrementing == false) {
      //   isVisibleFromRight();
      // }
      // if (amIncrementing == false) {
      //   isVisibleFromLeft();
      // }

      isVisibleFromTop();
      isVisibleFromBottom();
      isVisibleFromRight();
      isVisibleFromLeft();
      if (topScore * bottomScore * rightScore * leftScore > maxScore) {
        maxScore = topScore * bottomScore * rightScore * leftScore;
      }
    }
  }
//function to choose place in list to compare
  print('${grid[0].length}');
  print('inner visible = $totalVisible');
  print('outer visible = $additionalVisible');
  print('total visible = ${additionalVisible + totalVisible}');
  print('Max Score: $maxScore');

//compare values if > add to visible
}
