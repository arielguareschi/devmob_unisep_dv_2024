import 'package:flutter/material.dart';
import 'package:perguntados/questionario.dart';
import 'package:perguntados/resultado.dart';

void main() => runApp(const PerguntadosApp());

class PerguntadosApp extends StatefulWidget {
  const PerguntadosApp({super.key});

  @override
  State<PerguntadosApp> createState() => _PerguntadosAppState();
}

class _PerguntadosAppState extends State<PerguntadosApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual seu time?',
      'respostas': [
        {'texto': 'Gremio', 'pontuacao': 10},
        {'texto': 'Curintia', 'pontuacao': 5},
        {'texto': 'Inter', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Palmeiras tem mundial?',
      'respostas': [
        {'texto': 'Sim', 'pontuacao': 0},
        {'texto': 'Nao', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual seu genero?',
      'respostas': [
        {'texto': 'Sim', 'pontuacao': 0},
        {'texto': 'Nao', 'pontuacao': 10},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntados'),
          actions: [
            IconButton(
              onPressed: () => _reiniciarQuestionario(),
              icon: const Icon(
                Icons.refresh,
                color: Colors.red,
              ),
            )
          ],
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(
                _pontuacaoTotal,
                _reiniciarQuestionario,
              ),
      ),
    );
  }
}
