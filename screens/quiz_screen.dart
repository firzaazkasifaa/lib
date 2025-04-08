import 'package:flutter/material.dart';
import '../models/quiz_data.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;
  int? selectedOption;

  void _answerQuestion() {
    if (selectedOption == questions[currentIndex].correctAnswerIndex) {
      score++;
    }

    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedOption = null;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(score: score, total: questions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Soal ${currentIndex + 1}'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF3E7E9), Color(0xFFE3EEFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentQuestion.questionText,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ...List.generate(currentQuestion.options.length, (index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 6),
                child: RadioListTile<int>(
                  title: Text(currentQuestion.options[index]),
                  value: index,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                ),
              );
            }),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: selectedOption == null ? null : _answerQuestion,
                icon: Icon(Icons.send),
                label: Text('Kirim Jawaban'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
