class Question {
  String title;
  String answer;
  Question({title, answer}) {
    this.title = title;
    this.answer = answer;
  }

  isCorrect(submittedAnswer) {
    return answer == submittedAnswer;
  }
}
