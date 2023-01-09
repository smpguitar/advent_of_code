import 'dart:io';

gameScore() {
  //parse initial data
  String text =
      File('/Users/stephenparks/Development/rock_paper_scissor_data.txt')
          .readAsStringSync();

  // Split the text into lines
  List<String> lines = text.split('\n');

//assigning values to plays
  Map<String, int> playValue;

  playValue = {
    'A': 1,
    'B': 2,
    'C': 3,
    'X': 1,
    'Y': 2,
    'Z': 3,
  };

//list of variables
  String playA = '';
  String playB = '';
  int scoreA = 0;
  int scoreB = 0;
  int bonus = 0;
  int scoreOfRound = 0;
  int totalScore = 0;
  int round = 0;

  calculateBonus() {
    if (scoreA == scoreB) {
      bonus = 3;
    } else if ((playA == 'A' && playB == 'Y') ||
        (playA == 'B' && playB == 'Z') ||
        (playA == 'C' && playB == 'X')) {
      bonus = 6;
    } else {
      bonus = 0;
    }
  }

  calcScoreOfRound() {
    for (String line in lines) {
      //parse value of plays
      playA = line.substring(0, 1);
      playB = line.substring(2, 3);

      //convert to int
      scoreA = playValue[playA] as int;
      scoreB = playValue[playB] as int;

      //calculate score
      calculateBonus();
      scoreOfRound = scoreB + bonus;
      totalScore = totalScore + scoreOfRound;

      print('play A is: $playA play B is: $playB');
      print('Score A is:  $scoreA and Score B is: $scoreB');
      print('Bonus Score is: $bonus');
      print('score of round is: $scoreOfRound');
      print('round $round and the total score is: $totalScore');
      round++;
    }
  }

  calcScoreOfRound();
}
