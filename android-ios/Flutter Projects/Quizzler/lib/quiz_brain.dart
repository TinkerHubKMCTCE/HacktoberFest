import 'models/qna.dart';

class QuizBrain {
  int _qNum = 0;

  List<QnA> _questionBank = [
    QnA('Some cats are actually allergic to humans', true),
    QnA('You can lead a cow down stairs but not up stairs.', false),
    QnA('Approximately one quarter of human bones are in the feet.', true),
    QnA('A slug\'s blood is green.', true),
    QnA('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    QnA('It is illegal to pee in the Ocean in Portugal.', true),
    QnA('No piece of square dry paper can be folded in half more than 7 times.',
        false),
    QnA('In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    QnA('The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    QnA('The total surface area of two human lungs is approximately 70 square metres.',
        true),
    QnA('Google was originally called \"Backrub\".', true),
    QnA('Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    QnA('In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void nextQuestion() {
    if (_qNum < _questionBank.length - 1) {
      _qNum++;
    }
  }

  String getQText() {
    return _questionBank[_qNum].q;
  }

  bool getAText() {
    return _questionBank[_qNum].a;
  }

  bool isFinished() {
    if (_qNum >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _qNum = 0;
  }
}
