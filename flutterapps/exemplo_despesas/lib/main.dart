import 'dart:math';

import 'package:exemplo_despesas/componentes/transacao_form.dart';
import 'package:exemplo_despesas/componentes/transacao_lista.dart';
import 'package:exemplo_despesas/models/transacao.dart';
import 'package:flutter/material.dart';

main() => runApp(const ExemploDespesasApp());

class ExemploDespesasApp extends StatelessWidget {
  const ExemploDespesasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MinhaInicial(),
    );
  }
}

class MinhaInicial extends StatefulWidget {
  const MinhaInicial({super.key});

  @override
  State<MinhaInicial> createState() => _MinhaInicialState();
}

class _MinhaInicialState extends State<MinhaInicial> {
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

    Navigator.of(context).pop();
  }

  _abrirFormularioTransacaoModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransacaoForm(_addTransacao);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _abrirFormularioTransacaoModal(context),
          ),
        ],
        title: const Text("Despesas Pessoais"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Gráfico'),
              ),
            ),
            TransacaoLista(_transacoes),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _abrirFormularioTransacaoModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
