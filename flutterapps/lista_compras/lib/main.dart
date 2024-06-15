import 'package:flutter/material.dart';
import 'package:lista_compras/controllers/produto_controller.dart';

import 'models/produto.dart';

main() {
  runApp(const ListaCompras());
}

class ListaCompras extends StatelessWidget {
  const ListaCompras({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lista de Compras",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListaCompraPage(),
    );
  }
}

class ListaCompraPage extends StatefulWidget {
  const ListaCompraPage({super.key});

  @override
  State<ListaCompraPage> createState() => _ListaCompraPageState();
}

class _ListaCompraPageState extends State<ListaCompraPage> {
  final ProdutoController produtoController = ProdutoController();
  late Future<List<Produto>> _listaMercado;
  bool _mostraSomenteNao = false;

  @override
  void initState() {
    super.initState();
    _listaMercado = produtoController.getItems();
  }

  void _chamaItems() {
    setState(() {
      _listaMercado =
          produtoController.getItems(comprado: _mostraSomenteNao ? true : null);
    });
  }

  void _refreshList() {
    setState(() {
      _listaMercado = produtoController.getItems();
    });
  }

  void _showForm([Produto? item]) {
    final formKey = GlobalKey<FormState>();
    String nome = item?.nome ?? '';
    int quantidade = item?.quantidade ?? 1;
    bool comprado = item?.comprado ?? false;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(item == null ? 'Adicionar Item' : 'Editar Item'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: nome,
                  decoration: const InputDecoration(labelText: "Nome"),
                  onSaved: (value) => nome = value!,
                ),
                TextFormField(
                  initialValue: quantidade.toString(),
                  decoration: const InputDecoration(labelText: "Quantidade"),
                  onSaved: (value) => quantidade = int.parse(value!),
                  keyboardType: TextInputType.number,
                ),
                CheckboxListTile(
                  value: comprado,
                  title: const Text('Comprado'),
                  onChanged: (value) => setState(() => comprado = value!),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  final novoProduto = Produto(
                    id: item?.id,
                    nome: nome,
                    quantidade: quantidade,
                    comprado: comprado,
                  );
                  if (item == null) {
                    // novo item
                    produtoController
                        .addItem(novoProduto)
                        .then((_) => _refreshList());
                  } else {
                    // edita o item
                    produtoController
                        .updateItem(novoProduto)
                        .then((_) => _refreshList());
                  }
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Compras'),
        actions: [
          Switch(
            value: _mostraSomenteNao,
            onChanged: (value) {
              setState(() {
                _mostraSomenteNao = value;
                _chamaItems();
              });
            },
            activeColor: Colors.green,
            inactiveThumbColor: Colors.red,
          ),
        ],
      ),
      body: FutureBuilder<List<Produto>>(
        future: _listaMercado,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Sem items!'),
            );
          }

          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(item.nome),
                subtitle: Text('Quantidade ${item.quantidade}'),
                trailing: Checkbox(
                  value: item.comprado,
                  onChanged: (value) {
                    setState(() {
                      item.comprado = value!;
                    });
                    produtoController.updateItem(item);
                  },
                ),
                onLongPress: () => _showForm(item),
                onTap: () => _showForm(item),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
