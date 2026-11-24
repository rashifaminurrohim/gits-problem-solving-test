String solution2(List<int> leaderboard, List<int> scores) {
  List<int> uniqueBoard = leaderboard.toSet().toList();
  uniqueBoard.sort((a, b) => b - a);
  List<int> ranks = [];

  for (int i = 0; i < scores.length; i++) {
    int rank = uniqueBoard.length + 1;
    for (int j = 0; j < uniqueBoard.length; j++) {
      if (scores[i] >= uniqueBoard[j]) {
        rank = j + 1;
        break;
      }
    }
    ranks.add(rank);
  }
  return ranks.join(" ");
}

void main() {
  print(solution2([100, 100, 50, 40, 40, 20, 10], [5, 25, 50, 120]));
}
