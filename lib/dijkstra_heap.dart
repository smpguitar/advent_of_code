import 'package:collection/collection.dart';
import 'package:tuple/tuple.dart';

//This is dijkstra's *A variant

dijkstra(start, end, grid) {
  int sr = start.item1;
  int sc = start.item2;
  int er = end.item1;
  int ec = end.item2;
  int rows = grid.length - 1;
  int columns = grid[0].length - 1;
  bool done = false;

  List<int> dr = [-1, 1, 0, 0];
  List<int> dc = [0, 0, 1, -1];

  var heap = HeapPriorityQueue<Tuple3<int, int, int>>(
      (a, b) => a.item1.compareTo(b.item1));
  List<List<bool>> visited =
      List.generate(grid.length, (_) => List.filled(grid[0].length, false));

  //start dijkstra
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
    int currentValue = node.item1;
    int r = node.item2;
    int c = node.item3;
    print('finding neighbors');
    for (int i = 0; i < 4; i++) {
      int rr = r + dr[i];
      int cc = c + dc[i];
      visited[r][c] = true;
      // find qualifying adjacent squares
      if (rr >= 0 && cc >= 0) {
        if (rr <= rows && cc <= columns) {
          if (getLetterValue(grid[r][c], grid[rr][cc]) == true) {
            //add to heap
            heap.add(Tuple3<int, int, int>(currentValue + 1, rr, cc));
          }
        }
      }
    }
    //Done with this node. Mark as Visisted
    if (grid[r][c] == grid[er][ec]) {
      done = true;
    }
  }

//make start node distance 0 and update to visited
  heap.add(Tuple3<int, int, int>(0, sr, sc));

//identify valid neighbors of lowest distance item in unvisited
  while (heap.isNotEmpty) {
    var consider = heap.removeFirst();
    int r = consider.item2;
    int c = consider.item3;
    if (visited[r][c] == false) {
      exploreNeighbor(consider);
    }

    if (done == true) {
      print('Done! ${consider.item1}');
      break;
    }
  }
}
