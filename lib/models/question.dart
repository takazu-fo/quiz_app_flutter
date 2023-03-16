class Question {
  final String questionText;
  final List<String> answerChoices;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.answerChoices,
    required this.correctAnswerIndex,
  });

  static List<Question> getSampleQuestions() {
    return [
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
    ];
  }
}

