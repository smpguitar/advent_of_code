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
}
