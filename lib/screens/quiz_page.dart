import 'package:flutter/material.dart';
import 'package:quiz_app/models//question.dart';

import 'end_screen.dart'; // Questionクラスをインポート

class QuizPage extends StatefulWidget {
  final List<Question> questions;

  QuizPage({required this.questions});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  bool _isCorrect = false;
  int _score = 0; // スコアを追加

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Column(
        children: [
          _buildQuestion(),
          _buildAnswerButtons(),
          _buildFeedback(),
        ],
      ),
    );
  }

  Widget _buildQuestion() {
    return Text(widget.questions[_currentQuestionIndex].questionText);
  }

  Widget _buildAnswerButtons() {
    return Column(
      children: widget.questions[_currentQuestionIndex].answerChoices

          .asMap()
          .entries
          .map((entry) {
        int index = entry.key;
        String option = entry.value;
        return ElevatedButton(
          onPressed: () {
            _checkAnswer(index == widget.questions[_currentQuestionIndex].correctAnswerIndex);
          },
          child: Text(option),
        );
      }).toList(),
    );
  }

  void _checkAnswer(bool isCorrect) {
    setState(() {
      _isCorrect = isCorrect;
      if (isCorrect) {
        _score++; // 正解の場合にスコアを加算
      }
      _currentQuestionIndex++;

      if (_currentQuestionIndex == widget.questions.length) {
        _showEndScreen();
      }
    });
  }

  // クイズ終了後にEndScreenに遷移するメソッド
  void _showEndScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EndScreen(score: _score, totalQuestions: widget.questions.length),
      ),
    );
  }

  Widget _buildFeedback() {
    return Visibility(
      visible: _isCorrect != null,
      child: Text(_isCorrect ? 'Correct!' : 'Incorrect!'),
    );
  }
}
