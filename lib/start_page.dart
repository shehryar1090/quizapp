import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.quizScreen, {super.key});
  final void Function() quizScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "images/quiz-logo.png",
          width: 300,
          color: const Color.fromARGB(155, 255, 255, 255),
          // to add some transparency to the img, can also be done by wrapping the img with Opacity widget but its not the best practice
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Learn Flutter the fun way!",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton.icon(
          onPressed: quizScreen,
          icon: const Icon(Icons.arrow_right_alt),
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 132, 73, 191)),
          label: const Text("Start Quiz"),
        ),
      ],
    );
  }
}
