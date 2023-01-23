import 'dart:convert';
import 'dart:io';

decypher() {
//get input
  String text = File(
          '/Users/stephenparks/Development/advent_of_code/advent_of_code/bin/daynine_test_data.txt')
      .readAsStringSync();

  // Split the text into lines in a list
  LineSplitter ls = const LineSplitter();
  List<String> lines = ls.convert(text);
  List<List<String>> moves =
      lines.map((row) => row.split(" ").toList()).toList();

//create variables
  List<Set> visitedLocations = [];

  var head = [0, 0];
  var tail = [0, 0];

//parse every move
  for (int i = 0; i <= moves.length - 1; i++) {
    //set varable values
    String x = moves[i][0];
    int y = int.parse(moves[i][1]);
    print('move is: ${moves[i][0]}, ${moves[i][1]}');
    // for each move iterate for value y
    for (int j = 0; j < y; j++) {
      int dx = 0;
      int dy = 0;
      if (x == 'R') {
        dx = 1;
      }
      if (x == 'L') {
        dx = -1;
      }
      if (x == 'U') {
        dy = 1;
      }
      if (x == 'D') {
        dy = -1;
      }

      print(head);
      head[0] += dx;
      head[1] += dy;
      print('round $j');
      var _x = head[0] - tail[0];
      var _y = head[1] - tail[1];

//check if distance between head an tail is more than 1
      if (_x.abs() > 1 || _y.abs() > 1) {
        if (_x == 0) {
          tail[1] += _y ~/ 2;
        } else if (_y == 0) {
          tail[0] += _x ~/ 2;
        } else {
          if (_x > 0) {
            tail[0] += 1;
          }
          if (_x < 0) {
            tail[0] += -1;
          }
          if (_y > 0) {
            tail[1] += 1;
          }
          if (_y < 0) {
            tail[1] += -1;
          }
        }
        visitedLocations.add({tail[0], tail[1]});
        print('tail is at: ${tail[0]}, ${tail[1]}');
      }
    }
  }
  print('moves lenth is: ${moves.length}');
  print(visitedLocations.length);
}
