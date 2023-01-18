import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

decypher() {
//get input
  String text = File(
          '/Users/stephenparks/Development/advent_of_code/advent_of_code/bin/daynine_test_data.txt')
      .readAsStringSync();

  // Split the text into lines in a list
  LineSplitter ls = const LineSplitter();

  List<String> lines = ls.convert(text);
  print(lines);

  int tailMoves = 0;

  List<List<String>> moves =
      lines.map((row) => row.split("").toList()).toList();

  print(moves);
  print('moves length: ${moves.length}');

  for (int i = 0; i < moves.length - 1; i++) {
    String direction = '';
    int distance = 0;
    String direction1 = '';
    int distance1 = 0;
    String direction2 = '';
    int distance2 = 0;
    String direction3 = '';
    int distance3 = 0;
    bool opposite = false;

    isOpposite() {
      if (direction == 'R' && direction2 == 'L' ||
          direction == 'L' && direction2 == 'R' ||
          direction == 'U' && direction2 == 'D' ||
          direction == 'D' && direction2 == 'U') {
        opposite == true;
      }
    }

    if (i < 2) {
      direction1 = moves[i][0];
      distance1 = int.parse(moves[i][2]);
      tailMoves = distance1 - 1;
      // print('direction1: $direction1 distance: $distance1');
      print('distance = $distance');
      print('distance 1 = $distance1');
      print('distance 2 = $distance2');
    }
    if (i >= 2) {
      //two prior moves
      direction = moves[i - 2][0];
      distance = int.parse(moves[i - 2][2]);
      //prior move
      direction1 = moves[i - 1][0];
      distance1 = int.parse(moves[i - 1][2]);
      //current move
      direction2 = moves[i][0];
      distance2 = int.parse(moves[i][2]);
      //future move -- really only need to know if doubling back
      // direction3 = moves[i + 1][0];
      // distance3 = int.parse(moves[i + 1][2]);
      print('distance = $distance');
      print('distance 1 = $distance1');
      print('distance 2 = $distance2');
      if (distance1 == 1) {
        isOpposite();
        if (opposite == true && distance2 > 2) {
          tailMoves = tailMoves + distance2 - 2;
          print(opposite);
          opposite = false;
        } else {
          // no change to tailmoves
        }
      }
    }
    if (distance2 > 1) {
      isOpposite();
      if (opposite == true && distance2 > 2) {
        tailMoves = tailMoves + distance2 - 2;
        print(opposite);
        opposite = false;
      } else {
        // no change to tailmoves
      }
      if (opposite == false) {
        tailMoves = tailMoves + distance2 - 1;
        print('direction2: $direction2, distance2: $distance2');
        print('opposite = $opposite');
      }
    }
    // if it comes back on itself

    print('direction2: $direction2 distance: $distance2');

    print(tailMoves);
  }
}
