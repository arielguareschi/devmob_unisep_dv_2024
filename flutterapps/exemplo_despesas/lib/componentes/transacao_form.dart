import 'package:exemplo_despesas/componentes/botao_adaptativo.dart';
import 'package:exemplo_despesas/componentes/date_picker_adaptativo.dart';
import 'package:exemplo_despesas/componentes/text_field_adaptativo.dart';
import 'package:flutter/material.dart';

class TransacaoForm extends StatefulWidget {
  const TransacaoForm(this.onSubmit, {super.key});
  final void Function(String, double, DateTime) onSubmit;

  @override
  State<TransacaoForm> createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<TransacaoForm> {
  final tituloController = TextEditingController();
  final valorController = TextEditingController();
  DateTime _dataSelecionada = DateTime.now();

  _submitForm() {
    final titulo = tituloController.text;
    final valor = double.tryParse(valorController.text) ?? 0;

    if (titulo.isEmpty || valor <= 0) {
      return;
    }

    widget.onSubmit(titulo, valor, _dataSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              TextFieldAdaptativo(
                rotulo: 'Título',
                controller: tituloController,
                onSubmitted: (_) => _submitForm,
              ),
              TextFieldAdaptativo(
                rotulo: 'Valor (R\$)',
                controller: valorController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm,
              ),
              DatePickerAdaptativo(
                dataSelecionada: _dataSelecionada,
                onDateChanged: (newDate) {
                  setState(() {
                    _dataSelecionada = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  BotaoAdaptativo(
                    'Nova Transação',
                    _submitForm,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
