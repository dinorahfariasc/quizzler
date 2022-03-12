import 'package:flutter/services.dart';

import 'question.dart';

class QuizBrain {
  int _cont = 0;


  late final List<Question> _questionsBank = [
    Question('red velvet é o maior grupo do mundo', true),
    Question('2+2 = 22', false),
    Question('dinorah dorme cedo', false),
    Question('loona chuu', true),
    Question('loona has 12 members', true),
    Question('carnaval é a melhor época do ano', true),
    Question('dina vai pra academia todo dia', false),
    Question('o segundo nome de snoopy é nina', true),
    Question('(g)-idle tem 5 membros', false),
    Question('twice ja fez show no brasil', false),
    Question('red velvet tem 3 full albuns', false),
    Question('seulrene maior unit', true)

  ];

  // acresenta ao contador, checar se o numero da proxima questao ultrapassa o total no banco de questoes.
  void nextQuestion(){

    if (_cont < _questionsBank.length - 1)// como o lenth começa pelo 1, para nao ficar com uma questao a menos
    {
      _cont++;
    }


  }

  // functions para pegar partes especificas das questoes
  String getQuestionText() {
    return _questionsBank[_cont].questionText;
  }
  bool getQuestionAnswer() {
    return _questionsBank[_cont].questionAnswer;
  }
  bool finishedTest(){
    if (_cont >= _questionsBank.length - 1)
    {
      print('return true');
      return true;

    }
    else{
      print('return false');
      return false;
    }
  }
  reset() {
    _cont = 0;
  }



}