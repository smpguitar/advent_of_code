import 'dart:convert';
import 'dart:io';
import 'package:advent_of_code/dijkstra_heap_part2.dart';
import 'package:tuple/tuple.dart';

decypher() {
//get input
  String text = File(
          '/Users/stephenparks/Development/advent_of_code/advent_of_code/bin/daytwelve_data.txt')
      .readAsStringSync();

  // Split the text into lines in a list
  LineSplitter ls = const LineSplitter();
  List<String> lines = ls.convert(text);
  // List<String> lines = text.split(RegExp("\n"));
  List<List<String>> grid = lines.map((row) => row.split("").toList()).toList();
  Tuple2<int, int> start = Tuple2(0, 0);
  Tuple2<int, int> end = Tuple2(0, 0);

  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      if (grid[i][j] == 'S') {
        start = Tuple2<int, int>(i, j);
      }
      if (grid[i][j] == 'E') {
        end = Tuple2<int, int>(i, j);
      }
    }
  }

  dijkstra(start, end, grid);
}
