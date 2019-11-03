import './questions.dart';

class QuizController {
  
  final List<Question> _questions = [
    {
      "title":
          "This person created what is now known as the first computer program.  The program was made to help the Analytical Engine calculate numbers.",
      "answer": "Ada Lovelace"
    },
    {
      "title":
          "Steve Jobs and Steve Wozniak built their first computer using a wooden box.  Their company has grown and is still around today.  The name of the company is:",
      "answer": "Apple"
    },
    {
      "title":
          "This person is often called the inventor of the modern computer.  He actually created the first fully electronic computer.",
      "answer": "Konrad Zuse"
    },
    {
      "title":
          "This invention helped make computers much smaller and faster.  What is it called?",
      "answer": "Integrated Circuit"
    },
  ].map((Map<String, dynamic> item) {
    return Question(title: item['title'], answer: item['answer']);
  }).toList();

  String getQuizText(index) {
    return _questions[index].title;
  }

  bool isCorrect(index, answer){
    return _questions[index].isCorrect(answer);
  }

  int getNumberOfQuiz(){
    return _questions.length;
  }

}
