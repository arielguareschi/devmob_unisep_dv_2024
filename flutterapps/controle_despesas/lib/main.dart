import 'package:controle_despesas/components/transacao_usuario.dart';
import 'package:flutter/material.dart';

main() => runApp(const DespesasApp());

class DespesasApp extends StatelessWidget {
  const DespesasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MinhaInicial(),
    );
  }
}

class MinhaInicial extends StatelessWidget {
  const MinhaInicial({super.key});

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
              elevation: 5,
              color: Colors.blue,
              child: Text("Gráfico"),
            ),
          ),
          TransacaoUsuario(),
        ],
      ),
    );
  }
}
