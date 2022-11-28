import 'package:flutter/cupertino.dart';

import '../models/quiz_model.dart';

class QuizProvider with ChangeNotifier {
  final List<Question> _question = [
    Question(
      questionText: ' Which is your favourite color ?',
      answerList: [
        Answer(answerText: 'Blue', score: 10),
        Answer(answerText: 'Red', score: 7),
        Answer(answerText: 'Yellow', score: 5),
        Answer(answerText: 'White', score: 3),
      ],
    ),
    Question(
      questionText: 'Which is your favourite Animal ?',
      answerList: [
        Answer(answerText: 'Tiger', score: 10),
        Answer(answerText: 'Lion', score: 7),
        Answer(answerText: 'Elephant', score: 5),
        Answer(answerText: 'Dog', score: 3),
      ],
    ),
    Question(
      questionText: 'Which is your favorite Sports ?',
      answerList: [
        Answer(answerText: 'Cricket', score: 10),
        Answer(answerText: 'Golf', score: 7),
        Answer(answerText: 'FootBall', score: 5),
        Answer(answerText: 'BasketBall', score: 3),
      ],
    ),
    Question(
      questionText: 'Which is your favourite Bird ?',
      answerList: [
        Answer(answerText: 'Parrot', score: 10),
        Answer(answerText: 'Dove', score: 7),
        Answer(answerText: 'HummingBird', score: 5),
        Answer(answerText: 'Eagle', score: 3),
      ],
    ),
    Question(
      questionText: 'Which is your Place ?',
      answerList: [
        Answer(answerText: 'Singapore', score: 10),
        Answer(answerText: 'NewYork', score: 7),
        Answer(answerText: 'India', score: 5),
        Answer(answerText: 'Paris', score: 3),
      ],
    ),
  ];

  List<Question> get question => _question;

  late int _currentQuestionIndex = 0;

  int get currentQuestionIndex => _currentQuestionIndex;

  late int _totalScore = 0;

  int get totalScore => _totalScore;

  doCalculation(int score) {
    _totalScore += score;
    _currentQuestionIndex++;
    notifyListeners();
  }

  String get resultValue {
    String value;
    if (_totalScore <= 8) {
      value = 'You are bad';
    } else if (_totalScore <= 12) {
      value = 'You are likable';
    } else if (_totalScore <= 16) {
      value = 'You are good';
    } else {
      value = 'You are genius';
    }
    return value;
  }

  doReset() {
    _currentQuestionIndex = 0;
    _totalScore = 0;
    notifyListeners();
  }
}
