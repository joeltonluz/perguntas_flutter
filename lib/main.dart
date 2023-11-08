import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntasSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntasSelecionada++;
    });
    print(_perguntasSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual é sua cor favorita?',
        'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
      },
      {
        'texto': 'Qual é o seu animal preferido?',
        'respostas': ['Coelho', 'Cachorro', 'Gato', 'Rato'],
      },
      {
        'texto': 'Qual é o seu instrutor favorito?',
        'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
      },
    ];

    List<Widget> respostas = [];
    for (String textoResp
        in perguntas[_perguntasSelecionada].cast()['respostas']) {
      respostas.add(Resposta(textoResp, _responder));
      print(textoResp);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas Rápidas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntasSelecionada]['texto'].toString()),
            ...respostas,
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
    // TODO: implement createState
  }
}
