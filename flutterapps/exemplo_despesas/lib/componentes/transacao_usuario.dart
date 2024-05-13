import 'dart:math';

import 'package:exemplo_despesas/componentes/transacao_form.dart';
import 'package:exemplo_despesas/componentes/transacao_lista.dart';
import 'package:exemplo_despesas/models/transacao.dart';
import 'package:flutter/material.dart';

class TransacaoUsuario extends StatefulWidget {
  const TransacaoUsuario({super.key});

  @override
  State<TransacaoUsuario> createState() => _TransacaoUsuarioState();
}

class _TransacaoUsuarioState extends State<TransacaoUsuario> {
  @override
  final _transacoes = [
    Transacao(
      id: 't1',
      titulo: 'Novo Tenis',
      valor: 310.76,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't2',
      titulo: 'Outro Tenis',
      valor: 211.76,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't1',
      titulo: 'Novo Tenis',
      valor: 310.76,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't2',
      titulo: 'Outro Tenis',
      valor: 211.76,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't1',
      titulo: 'Novo Tenis',
      valor: 310.76,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't2',
      titulo: 'Outro Tenis',
      valor: 211.76,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't1',
      titulo: 'Novo Tenis',
      valor: 310.76,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't2',
      titulo: 'Outro Tenis',
      valor: 211.76,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't1',
      titulo: 'Novo Tenis',
      valor: 310.76,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't2',
      titulo: 'Outro Tenis',
      valor: 211.76,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't1',
      titulo: 'Novo Tenis',
      valor: 310.76,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't2',
      titulo: 'Outro Tenis',
      valor: 211.76,
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
        TransacaoForm(_addTransacao),
        TransacaoLista(_transacoes),
      ],
    );
  }
}
