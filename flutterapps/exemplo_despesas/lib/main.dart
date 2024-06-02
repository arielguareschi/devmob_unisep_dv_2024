import 'dart:io';
import 'dart:math';

import 'package:exemplo_despesas/componentes/grafico.dart';
import 'package:exemplo_despesas/componentes/transacao_form.dart';
import 'package:exemplo_despesas/componentes/transacao_lista.dart';
import 'package:exemplo_despesas/controller/transacao_controller.dart';
import 'package:exemplo_despesas/models/transacao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(ExemploDespesasApp());

class ExemploDespesasApp extends StatelessWidget {
  final ThemeData tema = ThemeData();

  ExemploDespesasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MinhaInicial(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: tema.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MinhaInicial extends StatefulWidget {
  const MinhaInicial({super.key});

  @override
  State<MinhaInicial> createState() => _MinhaInicialState();
}

class _MinhaInicialState extends State<MinhaInicial> {
  late Future<List<Transacao>> _transacoes;
  bool _showChart = false;
  final TransacaoController _controller = TransacaoController();

  @override
  initState() {
    super.initState();
    _transacoes = _controller.getTransacoes();
  }

  _refreshTransacao() {
    setState() {
      _transacoes = _controller.getTransacoes();
    }
  }

  List<Transacao> _transacoesRecentes(List<Transacao> dados) {
    if (dados.isNotEmpty) {
      return dados.where((tr) {
        return tr.data.isAfter(DateTime.now().subtract(
          const Duration(days: 7),
        ));
      }).toList();
    } else {
      return [];
    }
  }

  _addTransacao(String titulo, double valor, DateTime data) {
    final novaTransacao = Transacao(
      id: Random().nextDouble().toString(),
      titulo: titulo,
      valor: valor,
      data: data,
    );

    _controller.addTransacao(novaTransacao).then(_refreshTransacao());

    Navigator.of(context).pop();
  }

  _removeTransacao(String id) {
    setState(() {
      _controller.deleteItem(id).then(_refreshTransacao());
    });
  }

  _abrirFormularioTransacaoModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransacaoForm(_addTransacao);
      },
    );
  }

  Widget _getIconButton(IconData icon, Function() fn) {
    return Platform.isIOS
        ? GestureDetector(onTap: fn, child: Icon(icon))
        : IconButton(icon: Icon(icon), onPressed: fn);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final iconList = Platform.isIOS ? CupertinoIcons.refresh : Icons.list;
    final chartList =
        Platform.isIOS ? CupertinoIcons.refresh : Icons.show_chart;

    final actions = [
      if (isLandscape)
        _getIconButton(
          _showChart ? iconList : chartList,
          () {
            setState(() {
              _showChart = !_showChart;
            });
          },
        ),
      _getIconButton(
        Platform.isIOS ? CupertinoIcons.add : Icons.add,
        () => _abrirFormularioTransacaoModal(context),
      ),
    ];

    final PreferredSizeWidget appBar = AppBar(
      title: const Text('Despesas Pessoais'),
      actions: actions,
    );

    final availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final bodyPage = FutureBuilder<List<Transacao>>(
      future: _transacoes,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final items = snapshot.data!;

        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_showChart || !isLandscape)
                  SizedBox(
                    height: availableHeight * (isLandscape ? 0.8 : 0.3),
                    child: (_transacoesRecentes(items).isNotEmpty)
                        ? Grafico(_transacoesRecentes(items))
                        : const Text('Não tem items para listar'),
                  ),
                if (!_showChart || !isLandscape)
                  SizedBox(
                    height: availableHeight * (isLandscape ? 1 : 0.7),
                    child: TransacaoLista(items, _removeTransacao),
                  ),
              ],
            ),
          ),
        );
      },
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: const Text('Despesas Pessoais'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: actions,
              ),
            ),
            child: bodyPage,
          )
        : Scaffold(
            appBar: appBar,
            body: bodyPage,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () => _abrirFormularioTransacaoModal(context),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
