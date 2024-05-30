import 'package:exemplo_despesas/componentes/grafico_barra.dart';
import 'package:exemplo_despesas/models/transacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Grafico extends StatelessWidget {
  final List<Transacao> transacoesRecentes;

  const Grafico(this.transacoesRecentes, {super.key});

  List<Map<String, Object>> get transacoesAgrupadas {
    return List.generate(7, (index) {
      final diaSemana = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < transacoesRecentes.length; i++) {
        bool mesmoDia = transacoesRecentes[i].data.day == diaSemana.day;
        bool mesmoMes = transacoesRecentes[i].data.month == diaSemana.month;
        bool mesmoAno = transacoesRecentes[i].data.year == diaSemana.year;

        if (mesmoDia && mesmoMes && mesmoAno) {
          totalSum += transacoesRecentes[i].valor;
        }
      }

      return {
        'dia': DateFormat.E().format(diaSemana)[0],
        'valor': totalSum,
      };
    }).reversed.toList();
  }

  double get _totaldaSemana {
    return transacoesAgrupadas.fold(0.0, (sum, tr) {
      return sum + (tr['valor'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: transacoesAgrupadas.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: GraficoBarra(
                dia: tr['dia'] as String,
                valor: tr['valor'] as double,
                porcento: _totaldaSemana == 0
                    ? 0
                    : (tr['valor'] as double) / _totaldaSemana,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
