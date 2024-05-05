import 'package:exemplo_despesas/models/transacao.dart';
import 'package:flutter/material.dart';

main() => runApp(const ExemploDespesasApp());

class ExemploDespesasApp extends StatelessWidget {
  const ExemploDespesasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MinhaInicial(),
    );
  }
}

class MinhaInicial extends StatelessWidget {
  MinhaInicial({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
      ),
      body: const Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('Gráfico'),
            ),
          ),
          Card(
            child: Text('Lista de Transacoes'),
          ),
        ],
      ),
    );
  }
}
