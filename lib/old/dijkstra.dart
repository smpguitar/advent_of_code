import 'package:tuple/tuple.dart';

//This did not work to solve the puzzle for day 12

dijkstra(start, end, grid) {
  int sr = start.item1;
  int sc = start.item2;
  int er = end.item1;
  int ec = end.item2;
  int rows = grid.length - 1;
  int columns = grid[0].length - 1;
  double distance = 1;
  bool done = false;

  List<int> dr = [-1, 1, 0, 0];
  List<int> dc = [0, 0, 1, -1];

  Map<Tuple2<int, int>, List<dynamic>> unVisited = {};
  Map<Tuple2<int, int>, List<dynamic>> answer = {};
  List<List<bool>> visited =
      List.generate(grid.length, (_) => List.filled(grid[0].length, false));
  double smallestValue = double.infinity;

  //start dijkstra
  getListOfNodes() {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[0].length; j++) {
        unVisited[Tuple2<int, int>(i, j)] = [double.infinity, null];
      }
    }
  }

  getNextKey() {
    for (var entry in unVisited.entries) {
      if (entry.value[0] < smallestValue) {
        print('entry:  $entry');
        //return the value for exploreNeighbor
        return entry.key;
      }
    }
  }

  getLetterValue(currentLetter, nextLetter) {
    if (currentLetter == 'S') {
      currentLetter = 'a';
    }
    if (nextLetter == 'E') {
      nextLetter = 'z';
    }
    int value = currentLetter.codeUnitAt(0);
    int nextValue = nextLetter.codeUnitAt(0);
    if (nextValue - value <= 1) {
      return true;
    } else {
      return false;
    }
  }

  exploreNeighbor(node) {
    int r = node.item1;
    int c = node.item2;
    double currentValue = unVisited[Tuple2<int, int>(r, c)]![0];
    for (int i = 0; i < 4; i++) {
      int rr = r + dr[i];
      int cc = c + dc[i];
      print('search $rr, $cc');

      // find qualifying adjacent squares
      if (rr >= 0 && cc >= 0) {
        if (rr <= rows && cc <= columns) {
          if (visited[rr][cc] == false &&
              getLetterValue(grid[r][c], grid[rr][cc]) == true) {
            //get distance of node from source
            if (currentValue + 1 <= unVisited[Tuple2<int, int>(rr, cc)]![0]) {
              print(
                  'updating unVisited value: ${unVisited[Tuple2<int, int>(rr, cc)]![0]} to $currentValue');
              // if the value found is less than  known value, update
              unVisited[Tuple2<int, int>(rr, cc)] = [
                currentValue + distance,
                Tuple2<int, int>(r, c),
                grid[r][c]
              ];
            }
          }
        }
      }
    }
    //Done with this node. logging visited, logging answer, removing from unvisited List
    visited[r][c] = true;
    answer[Tuple2<int, int>(r, c)] =
        List.from(unVisited[Tuple2<int, int>(r, c)]!);
    unVisited.remove(Tuple2<int, int>(r, c));

    if (grid[r][c] == grid[er][ec]) {
      print('Done!! Moves: ${answer[Tuple2<int, int>(r, c)]![0]}');
      done = true;
    }
  }

//get all nodes and add to unvisited
  getListOfNodes();
//make start node distance 0 and update to visited
  unVisited[Tuple2<int, int>(sr, sc)]![0] = 0.0;

//identify valid neighbors of lowest distance item in unvisited
  while (unVisited.isNotEmpty) {
    exploreNeighbor(getNextKey());
    print('unVisited Length: ${unVisited.length}');
    if (done == true) {
      break;
    }
  }
  print('answer is ${answer[Tuple2<int, int>(er, ec)]}');
}
