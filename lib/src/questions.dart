class Question {
  String title;
  String answer;
  Question({title, answer}) {
    this.title = title;
    this.answer = answer;
  }

  isCorrect(submittedAnswer){
    return answer==submittedAnswer;
  }
}

final questions = [
  {"title": "This person created what is now known as the first computer program.  The program was made to help the Analytical Engine calculate numbers.", "answer": "Ada Lovelace"},
  {"title": "Steve Jobs and Steve Wozniak built their first computer using a wooden box.  Their company has grown and is still around today.  The name of the company is:", "answer": "Apple"},
  {"title": "This person is often called the inventor of the modern computer.  He actually created the first fully electronic computer.", "answer": "Konrad Zuse"},
  {"title": "This invention helped make computers much smaller and faster.  What is it called?", "answer": "Integrated Circuit"},
];
