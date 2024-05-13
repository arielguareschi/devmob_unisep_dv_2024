import 'package:flutter/material.dart';

class TransacaoForm extends StatelessWidget {
  TransacaoForm(this.onSubmit, {super.key});
  final tituloController = TextEditingController();
  final valorController = TextEditingController();

  final void Function(String, double) onSubmit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valorController,
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text(
                    'Nova Transação',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                  onPressed: () {
                    final titulo = tituloController.text;
                    final valor = double.tryParse(valorController.text) ?? 0.0;
                    onSubmit(titulo, valor);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
