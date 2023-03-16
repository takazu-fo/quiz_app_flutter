import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_page.dart';

import 'package:quiz_app/models//question.dart';
// 以下のインポートを追加してください。
// import 'quiz_page.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('クイズアプリ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'クイズを開始する準備ができましたか？',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 30),
            // ElevatedButton(
            //   onPressed: () {
            //     // ボタンを押すとQuizPageに遷移する
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => QuizPage(questions: const [],)),
            //     );
            //   },
            //   child: Text('スタート', style: TextStyle(fontSize: 18)),
            ElevatedButton(
              onPressed: () {
                // ボタンを押すとQuizPageに遷移する
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(
                      questions: [
                        Question(
                          questionText: '世界で最も話されている言語は何ですか？',
                          answerChoices: ['英語', '中国語', 'スペイン語', 'ヒンディー語'],
                          correctAnswerIndex: 1,
                        ),
                        Question(
                          questionText: '光の速度は、1秒あたりどのくらいの距離を進みますか？',
                          answerChoices: ['3,000 km', '300,000 km', '30,000 km', '3,000,000 km'],
                          correctAnswerIndex: 1,
                        ),
                        Question(
                          questionText: '太陽系で最も大きな惑星はどれですか？',
                          answerChoices: ['地球', '火星', '木星', '土星'],
                          correctAnswerIndex: 2,
                        ),
                        // 他のQuestionオブジェクトを追加...
                      ],
                    ),
                  ),
                );
              },
              child: Text('スタート', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                primary: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
