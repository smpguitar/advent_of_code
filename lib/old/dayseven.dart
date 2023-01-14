import 'dart:io';

decypher() {
//get input
  String text = File(
          '/Users/stephenparks/Development/advent_of_code/advent_of_code/bin/files_data.txt')
      .readAsStringSync();

  // Split the text into lines in a list
  List<String> data = text.split('\n');

//data structures
  int sizeLimit = 100000;
  List<String> path = [];
  Map<String, int> directorySizes = {};

  //commands
  String terminalPrompt = '\$';
  String cdCommand = 'cd';
  String rootDirectory = '/';
  String previousDirectory = '..';
  String directoryLabel = 'dir';

  //parse the commands
  for (String line in data) {
    List<String> words = line.split(' ');
    if (words[0] == terminalPrompt) {
      //deal with file path
      // print(terminalPrompt);
      if (words[1] == cdCommand) {
        if (words[2] == rootDirectory) {
          //root directory

          path.clear();
        }
        if (words[2] == previousDirectory) {
          //previous directory
          int place = path.length - 1;
          path.removeAt(place);
        } else {
          //changing directory
          path.add(words[2]);
        }
      }
    } else {
      //deal with sizes
      if (words[0] != directoryLabel) {
        int size = int.parse(words[0]);
        for (int i = 0; i < path.length; i++) {
          if (i == 0) {
            int? currentValue = directorySizes[path[i]];
            if (directorySizes[path[i]] != null) {
              directorySizes[path[i]] = currentValue! + size;
            } else {
              directorySizes[path[i]] = size;
            }
          } else {
            String parent = path[i - 1];
            String current = path[i];
            String directoryKey = '$parent / $current';
            int? currentValue = directorySizes[directoryKey];
            if (directorySizes[directoryKey] != null) {
              directorySizes[directoryKey] = currentValue! + size;
            } else {
              directorySizes[directoryKey] = size;
            }
          }
        }
      }
    }
  }

  //answers total file sizes under size limit
  for (int size in directorySizes.values) {
    if (size <= sizeLimit) {}
  }

//find the smallest file
  int unusedSpace = 30000000;
  int totalSpace = 70000000;
  int currentUnusedSpace = totalSpace - directorySizes['/']!;
  int minSpace = unusedSpace - currentUnusedSpace;

  List<int> fileSizes = directorySizes.values.toList();
  fileSizes.sort();
  print(fileSizes);
  for (int val in fileSizes) {
    if (val >= minSpace) {
      print(val);
      return;
    }
  }

  // print(total);
}
