import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  int _score = 0;

  void checkAns(bool userPickedAns) {
    bool correctAns = quizBrain.getAText();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'You\'ve finished all questions!!',
          desc: 'Your score: $_score / 13',
          content: Column(
            children: [
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  primary: Colors.green,
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Reset',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          style: AlertStyle(
            isCloseButton: false,
            isOverlayTapDismiss: false,
            titleStyle: TextStyle(color: Colors.white, fontSize: 24),
            descStyle: TextStyle(color: Colors.white70),
            backgroundColor: Colors.grey[900],
            alertBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            isButtonVisible: false,
          ),
        ).show();

        quizBrain.reset();
        _score = 0;

        scoreKeeper = [];
      } else {
        if (userPickedAns == correctAns) {
          _score++;
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: scoreKeeper,
          ),
        ),
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: Text(
                "True",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                checkAns(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text(
                "False",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                checkAns(false);
              },
            ),
          ),
        ),
      ],
    );
  }
}
