class Question {
  late String questionText;
  late List<Answer> answerList;
  Question({required this.questionText, required this.answerList});
}

class Answer {
  late String answerText;
  late int score;

  Answer({required this.answerText, required this.score});
}
