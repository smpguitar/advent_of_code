import 'dart:io';

gameScore() {
  //parse initial data
  String text =
      File('/Users/stephenparks/Development/rock_paper_scissor_data.txt')
          .readAsStringSync();

  // Split the text into lines
  List<String> lines = text.split('\n');

  Map<String, int> win;
  Map<String, int> lose;
  Map<String, int> draw;

  win = {'A': 2, 'B': 3, 'C': 1};
  lose = {'A': 3, 'B': 1, 'C': 2};
  draw = {'A': 1, 'B': 2, 'C': 3};

//list of variables
  String playA = '';
  String playB = '';

  // int scoreA = 0;
  int scoreB = 0;
  int bonus = 0;
  int scoreOfRound = 0;
  int totalScore = 0;
  int round = 0;

  calculateBonus() {
    if (playB == 'X') {
      bonus = 0;
    } else if (playB == 'Y') {
      bonus = 3;
    } else {
      bonus = 6;
    }
  }

  calcScoreOfRound() {
    for (String line in lines) {
      //parse value of plays
      playA = line.substring(0, 1);
      playB = line.substring(2, 3);

      //convert to int
      if (playB == 'X') {
        scoreB = lose[playA] ?? 0;
      }
      if (playB == 'Y') {
        scoreB = draw[playA] ?? 0;
      }
      if (playB == 'Z') {
        scoreB = win[playA] ?? 0;
      }

      //calculate score
      calculateBonus();
      scoreOfRound = scoreB + bonus;
      totalScore = totalScore + scoreOfRound;

      print('play B is: $playB');
      print('Score B is: $scoreB');
      print('Bonus Score is: $bonus');
      print('score of round is: $scoreOfRound');
      print('round $round and the total score is: $totalScore');
      round++;
    }
  }

  calcScoreOfRound();
}
