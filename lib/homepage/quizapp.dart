import 'package:flutter/material.dart';
import 'package:quizapp/model/question.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name("There are five zeros in one hundred thousand", true),
    Question.name("It is possible to sneeze while sleeping.", false),
    Question.name("Ears are responsible for smelling.", false),
    Question.name("Butterflies are not birds.", true),
    Question.name("The Sahara desert is the biggest desert in the world.", true),
    Question.name("Crocodiles shed tears when they eat food.", true),
    Question.name("Omnivores eat only plants.", false),
    Question.name("The Amazon is the densest forest in the world.", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(builder: (context) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                "images/flag.png",
                width: 250,
                height: 180,
              )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(color: Colors.blueGrey.shade400, style: BorderStyle.solid),
                  ),
                  height: 120.0,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                      style: const TextStyle(fontSize: 16.9, color: Colors.white),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () => _prevQuestion(),
                    color: Colors.blueGrey.shade400,
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswers(true, context),
                    color: Colors.green.shade400,
                    child: const Text(
                      "TRUE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswers(false, context),
                    color: Colors.red.shade400,
                    child: const Text(
                      "FALSE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade400,
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        );
      }),
    );
  }

  _checkAnswers(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      debugPrint('correct');
      final snackbar = SnackBar(
        content: Center(
            child: Text(
          'Correct!',
          style: TextStyle(fontSize: 16.9, color: Colors.white),
        )),
        duration: Duration(milliseconds: 200),
        backgroundColor: Colors.green.shade400,
      );
      Scaffold.of(context).showSnackBar(snackbar);
      _nextQuestion();
    } else {
      debugPrint('incorrect');
      final snackbar = SnackBar(
        content: Center(
            child: Text(
          'InCorrect!',
          style: TextStyle(fontSize: 16.9, color: Colors.white),
        )),
        duration: Duration(milliseconds: 300),
        backgroundColor: Colors.red.shade400,
      );
      Scaffold.of(context).showSnackBar(snackbar);
      _nextQuestion();
    }
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}
