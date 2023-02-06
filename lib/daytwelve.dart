import 'dart:io';
import 'dart:math';

decypher() {
//get input
  String text = File(
          '/Users/stephenparks/Development/advent_of_code/advent_of_code/bin/dayeleven_data.txt')
      .readAsStringSync();

  // Split the text into lines in a list
  // LineSplitter ls = const LineSplitter();
  List<String> lines = text.split(RegExp("\n\n"));
}
