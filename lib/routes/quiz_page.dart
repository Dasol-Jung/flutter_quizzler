import 'package:flutter/material.dart';
import '../src/questions.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  bool isOver = false;
  List<bool> score = [];
  TextEditingController controller = TextEditingController();
  List<Question> questionList = List.generate(questions.length, (index) {
    return Question(
        title: questions[index]['title'], answer: questions[index]['answer']);
  });

  submitAnswer(answer) {
    score.add(questionList[currentIndex].isCorrect(answer));
    controller.clear();
    if (currentIndex < questionList.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else if (currentIndex == questionList.length - 1) {
      setState(() {
        isOver = true;
        currentIndex = 0;
      });
    }
  }

  List<Icon> buildResult() {
    return score.map((isCorrect) {
      return isCorrect
          ? Icon(Icons.check, color: Colors.green)
          : Icon(Icons.clear, color: Colors.red);
    }).toList();
  }

  Text renderMainText() {
    if (!isOver) {
      return Text(
        questionList[currentIndex].title,
        style: TextStyle(fontSize: 20.0, height: 1.5),
      );
    } else {
      var totalScore = 0;
      score.forEach((item) {
        if (item) {
          totalScore++;
        }
      });
      return Text(
        "Your final score is $totalScore",
        style: TextStyle(
          fontSize: 30.0,
        ),
      );
    }
  }

  List<Widget> renderInputAndButtons() {
    if (!isOver) {
      return [
        Expanded(
          flex: 8,
          child: Container(
            margin: EdgeInsets.only(right: 10),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "Answer here",
                fillColor: Colors.grey[100],
              ),
            ),
          ),
        ),
        RaisedButton(
          child: Text("Submit"),
          onPressed: () => submitAnswer(controller.text),
        )
      ];
    } else {
      return [
        RaisedButton(
            child: Text("Restart"),
            onPressed: () {
              setState(() {
                currentIndex = 0;
                isOver = false;
                score = [];
              });
            })
      ];
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Center(
                  child: renderMainText(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: renderInputAndButtons(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: buildResult(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
