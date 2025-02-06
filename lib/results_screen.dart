import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.selectedAnswers, required this.onRestart});

  final List<String> selectedAnswers;
  final void Function() onRestart;

  getQuizSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getQuizSummary();
    final totalQuestions = questions.length;
    final totalCorrectAnswers = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "You answered $totalCorrectAnswers out of $totalQuestions questions correctly!",
          style: const TextStyle(
            color: Color.fromARGB(255, 236, 201, 243),
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        QuestionsSummary(summaryData),
        const SizedBox(
          height: 30,
        ),
        TextButton.icon(
          onPressed: onRestart,
          icon: const Icon(Icons.refresh_outlined),
          style: TextButton.styleFrom(
            backgroundColor:  const Color.fromARGB(255, 132, 73, 191),
            foregroundColor: Colors.white,
          ),
          label: const Text(
            "Restart Quiz!",
          ),
        ),
      ],
    );
  }
}
