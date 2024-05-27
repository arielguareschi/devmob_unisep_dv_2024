import 'dart:math';

import 'package:controle_despesas/components/transacao_form.dart';
import 'package:controle_despesas/components/transacao_lista.dart';
import 'package:controle_despesas/models/transacao.dart';
import 'package:flutter/material.dart';

class TransacaoUsuario extends StatefulWidget {
  const TransacaoUsuario({super.key});

  @override
  State<TransacaoUsuario> createState() => _TransacaoUsuarioState();
}

class _TransacaoUsuarioState extends State<TransacaoUsuario> {
  final _transacoes = [
    Transacao(
      id: 't1',
      titulo: 'Novo Tenis',
      valor: 550.99,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't2',
      titulo: 'Camiseta',
      valor: 352.90,
      data: DateTime.now(),
    ),
  ];

  _addTransacao(String titulo, double valor) {
    final novaTransacao = Transacao(
      id: Random().nextDouble().toString(),
      titulo: titulo,
      valor: valor,
      data: DateTime.now(),
    );

    setState(() {
      _transacoes.add(novaTransacao);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransacaoLista(_transacoes),
        TransacaoForm(_addTransacao),
      ],
    );
  }
}
