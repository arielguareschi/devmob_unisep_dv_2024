import 'package:flutter/material.dart';
import 'package:perguntados/questao.dart';

void main() {
  runApp(const PerguntadosApp());
}

class PerguntadosApp extends StatefulWidget {
  const PerguntadosApp({super.key});

  @override
  State<PerguntadosApp> createState() => _PerguntadosAppState();
}

class _PerguntadosAppState extends State<PerguntadosApp> {
  final _perguntaSelecionada = 0;
  final _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual seu time?',
      'respostas': [
        {'texto': 'Gremio', 'pontuacao': 10},
        {'texto': 'Curintia', 'pontuacao': 5},
        {'texto': 'Inter', 'pontuacao': 1},
      ],
    },
    'Qual seu time?',
    'Qual seu animal favorito?',
    'O Palmeiras tem mundial?',
    'Qual seu genero?',
  ];

  void responder() {
    setState(() {
      if (perguntaSelecionada >= perguntas.length - 1) {
        perguntaSelecionada = 0;
      } else {
        perguntaSelecionada++;
      }
    });
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntados'),
        ),
        body: Column(
          children: [
            // PERGUNTA
            Questao(
              perguntas: perguntas,
              perguntaSelecionada: perguntaSelecionada,
            ),
            // RESPOSTA 1
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: responder,
                child: const Text('Resposta 1'),
              ),
            ),
            // RESPOSTA 2
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: responder,
                child: const Text('Resposta 2'),
              ),
            ),
            // RESPOSTA 3
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: responder,
                child: const Text('Resposta 3'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
