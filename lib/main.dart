// import 'package:flutter/material.dart';
// import 'package:quiz_app/widgets/result_widget.dart';
//
// import 'models/quiz_model.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//       ),
//       home: const QuizOverViewScreen(),
//     );
//   }
// }
//
// class QuizOverViewScreen extends StatefulWidget {
//   const QuizOverViewScreen({Key? key}) : super(key: key);
//
//   @override
//   State<QuizOverViewScreen> createState() => _QuizOverViewScreenState();
// }
//
// class _QuizOverViewScreenState extends State<QuizOverViewScreen> {
//   int currentQuestionIndex = 0;
//
//   List<Question> questions = [
//     Question(
//       questionText: ' What is your favourite color ?',
//       answerList: [
//         Answer(answerText: 'blue', score: 10),
//         Answer(answerText: 'red', score: 7),
//         Answer(answerText: 'yellow', score: 5),
//         Answer(answerText: 'white', score: 3),
//       ],
//     ),
//     Question(
//       questionText: 'What is your favourite animal ?',
//       answerList: [
//         Answer(answerText: 'Tiger', score: 10),
//         Answer(answerText: 'Lion', score: 7),
//         Answer(answerText: 'Elephant', score: 5),
//         Answer(answerText: 'Dog', score: 3),
//       ],
//     ),
//     Question(
//       questionText: 'What is your favourite game ?',
//       answerList: [
//         Answer(answerText: 'Cricket', score: 10),
//         Answer(answerText: 'Golf', score: 7),
//         Answer(answerText: 'FootBall', score: 5),
//         Answer(answerText: 'BasketBall', score: 3),
//       ],
//     ),
//   ];
//   int totalScore = 0;
//
//   doCalculation(int score) {
//     totalScore += score;
//     setState(() {
//       currentQuestionIndex++;
//     });
//   }
//
//   _doReset() {
//     setState(() {
//       currentQuestionIndex = 0;
//       totalScore = 0;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.purple,
//         appBar: AppBar(
//           elevation: 1,
//           title: const Text(
//             'Quiz App',
//             style: TextStyle(fontSize: 25),
//           ),
//           centerTitle: true,
//         ),
//         body: currentQuestionIndex < questions.length
//             ? Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 7,
//                   ),
//                   Container(
//                     margin: const EdgeInsets.all(8),
//                     child: Text(
//                       'Question : ${currentQuestionIndex + 1}/${questions.length}',
//                       style: const TextStyle(
//                           fontSize: 20, fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                   _questionList(),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   ...questions[currentQuestionIndex].answerList.map((e) {
//                     return _answerButton(e);
//                   }).toList()
//                 ],
//               )
//             : ResultScreen(
//                 totalValue: totalScore,
//                 doReset: _doReset,
//               ));
//   }
//
//   Center _answerButton(Answer answer) {
//     return Center(
//       child: Container(
//         margin: const EdgeInsets.all(8),
//         width: MediaQuery.of(context).size.width / 1.3,
//         child: InkWell(
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.all(12),
//               shape: const StadiumBorder(),
//               foregroundColor: Colors.black,
//               backgroundColor: Colors.white,
//             ),
//             onPressed: () => doCalculation(answer.score),
//             child: Text(
//               answer.answerText,
//               style:
//                   const TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Container _questionList() {
//     return Container(
//       margin: const EdgeInsets.all(10),
//       alignment: Alignment.center,
//       width: double.infinity,
//       padding: const EdgeInsets.all(30),
//       decoration: BoxDecoration(
//           color: Colors.orangeAccent, borderRadius: BorderRadius.circular(20)),
//       child: Text(
//         ' ${currentQuestionIndex + 1}. ${questions[currentQuestionIndex].questionText}',
//         style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:quiz_app/providers/quiz_provider.dart';
import 'package:quiz_app/widgets/result_widget.dart';

import 'models/quiz_model.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const SplashScreen());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: AnimatedSplashScreen(
          backgroundColor: Colors.teal,
          splash: Column(
            children: [
              Image.asset('assets/quiz-icon.png'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Quiz Time',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ],
          ),
          nextScreen: const MyApp(),
          splashIconSize: 200,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.bottomToTop,
            duration: 4000,
          animationDuration: const Duration(seconds: 1),

          // animationDuration: const Duration(milliseconds: 3000),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => QuizProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const SafeArea(child: QuizOverViewScreen()),
      ),
    );
  }
}

class QuizOverViewScreen extends StatelessWidget {
  const QuizOverViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionData = context.watch<QuizProvider>();

    return Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          elevation: 1,
          title: const Text(
            'Quiz App',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: questionData.currentQuestionIndex < questionData.question.length
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 7,
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: Text(
                      'Question : ${questionData.currentQuestionIndex + 1}/${questionData.question.length}',
                      style: const TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                  ),
                  _questionList(questionData),
                  const SizedBox(
                    height: 20,
                  ),
                  ...questionData
                      .question[questionData.currentQuestionIndex].answerList
                      .map((e) {
                    return _answerButton(context, e, questionData);
                  }).toList()
                ],
              )
            : const ResultScreen(
                // totalValue: totalScore,
                // doReset: _doReset,
                ));
  }

  Center _answerButton(
    BuildContext context,
    Answer answer,
    QuizProvider questionData,
  ) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width / 1.3,
        child: InkWell(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(12),
              shape: const StadiumBorder(),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              questionData.doCalculation(
                answer.score,
              );
            },
            child: Text(
              answer.answerText,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Container _questionList(QuizProvider questionData) {
    return Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: Colors.orangeAccent, borderRadius: BorderRadius.circular(20)),
      child: Text(
        ' ${questionData.currentQuestionIndex + 1}. ${questionData.question[questionData.currentQuestionIndex].questionText}',
        style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
      ),
    );
  }
}
