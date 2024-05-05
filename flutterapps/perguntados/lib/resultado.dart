import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(
    this.pontuacao,
    this.quandoReiniciarQuestionario, {
    super.key,
  });

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'NooooooBBBBBB!';
    } else if (pontuacao < 12) {
      return 'Eh ta baum!';
    } else if (pontuacao < 16) {
      return 'Impreçionante!';
    } else {
      return 'AAAA Galo veio!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: const Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
