import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(quizz());
}

class quizz extends StatefulWidget {
  quizz({Key? key}) : super(key: key);

  @override
  _quizzlerState createState() => _quizzlerState();
}

class _quizzlerState extends State<quizz> {
  List<Widget> scoreList = [];
  // cont de acertos
  int numCorrect = 0;

// todo adicionar um alerta ao fina do quizz com os acertos/total de questoes


void checkAnswer(bool userAnswer) {
    setState(
      () {
        if (quizBrain.finishedTest() == true) {
          quizBrain.reset();
          scoreList = [];
          numCorrect = 0;


        }
        else {
          if (quizBrain.getQuestionAnswer() == userAnswer) {
            numCorrect++;
            scoreList.add(
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
          }
          else {
            scoreList.add(
              Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          }
          quizBrain.nextQuestion();
        }
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.black38,
          title: Text('Quizz'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      quizBrain.getQuestionText(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                    onPressed: () {
                      checkAnswer(true);
                    },
                    child: Text('True'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.green,
                      textStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                    onPressed: () {
                      checkAnswer(false);
                    },
                    child: Text('False'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.red,
                      textStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: scoreList,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


