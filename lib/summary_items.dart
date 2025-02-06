import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/question_identifier.dart';

class SummaryItems extends StatelessWidget {
  const SummaryItems({super.key, required this.items});

  final Map<String, Object> items;
  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = items['user_answer'] == items['correct_answer'];
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            questionIndex: items['question_index'] as int,
            isCorrectAnswer: isCorrectAnswer,
          ),
          const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items['question'] as String,
                          style: GoogleFonts.montserrat(color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          items['user_answer'] as String,
                          style: const TextStyle(color: Color.fromARGB(255, 111, 203, 215)),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          items['correct_answer'] as String,
                          style: const TextStyle(color: Color.fromARGB(255, 233, 40, 178)),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  )
        ],
      ),
    );
  }
}
