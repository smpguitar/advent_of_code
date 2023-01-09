import 'dart:io';

decypher() {
//get input
  String text = File(
          '/Users/stephenparks/Development/advent_of_code/advent_of_code/bin/decypher_data.txt')
      .readAsStringSync();

  // Split the text into lines in a list
  List<String> data = text.split('');
  int start = 0;
  int end = 14;

  isMatch(list) {
    List<String> holder = list.toSet().toList();
    return holder.length;
  }

  for (int i = 0; i < text.length - 3; i++) {
    List<String> items = data.sublist(start, end);
    print(items);
    start = start + 1;
    end = end + 1;
    if (isMatch(items) == items.length) {
      print(end - 1);
      return;
    }
  }
}
