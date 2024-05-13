import 'package:exemplo_despesas/componentes/transacao_usuario.dart';
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

class MinhaInicial extends StatelessWidget {
  const MinhaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
        title: const Text("Despesas Pessoais"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Gráfico'),
              ),
            ),
            TransacaoUsuario(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
