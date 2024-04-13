import 'package:flutter/material.dart';

void main() {
  runApp(const PerguntadosApp());
}

class PerguntadosApp extends StatelessWidget {
  const PerguntadosApp({super.key});

  void responder() {
    print('Pergunta respondida!');
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual seu time?',
      'Qual seu animal favorito?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntados'),
        ),
        body: Column(
          children: [
            Text(perguntas[0]),
            ElevatedButton(
              onPressed: responder,
              child: const Text('Resposta 1'),
            ),
            ElevatedButton(
              onPressed: () {
                print('respondeu 2');
              },
              child: const Text('Resposta 2'),
            ),
            ElevatedButton(
              onPressed: () => print('resposta 3'),
              child: const Text('Resposta 3'),
            ),
          ],
        ),
      ),
    );
  }
}
