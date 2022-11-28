import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/providers/quiz_provider.dart';

class ResultScreen extends StatelessWidget {
  // final int totalValue;
  // final Function doReset;
  const ResultScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionData = context.watch<QuizProvider>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: InkWell(
            onTap: () {
              _showResult(context, questionData.resultValue,
                  questionData.totalScore, questionData);
            },
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Text(
                'Result',
                style: TextStyle(fontSize: 25, color: Colors.purple),
              ),
            ),
          ),
        )
      ],
    );
  }

  _showResult(
      context, String resultValue, int totalScore, QuizProvider questionData) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(resultValue),
            content: Text('Score : $totalScore'),
            actions: [
              TextButton(
                  onPressed: () {
                    questionData.doReset();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Restart'))
            ],
          );
        });
  }
}
