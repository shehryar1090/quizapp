import 'package:flutter/material.dart';
import 'package:quiz_app/question_sreen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_page.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = "questions-screen";
    });
  }

  void choosenAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = "questions-screen";
    });
  }

  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);
  // }
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(
        onSelectAnswer: choosenAnswer,
      );
    }

    if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(
        selectedAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    //this is another approach, screenWidget can be assigned to the child
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 64, 12, 138),
                Color.fromARGB(255, 132, 73, 191),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: screenWidget,
            //activeScreen == "start-screen" ? StartScreen(SwitchScreen) : const QuestionsScreen(),
            // we can use this approach too, we won't need the initState method anymore
          ),
        ),
      ),
    );
  }
}
