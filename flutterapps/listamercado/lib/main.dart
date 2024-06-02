import 'package:flutter/material.dart';
import 'package:listamercado/controllers/produtos_controller.dart';
import 'package:listamercado/models/produto_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista Mercado',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MercadoListPage(),
    );
  }
}

class MercadoListPage extends StatefulWidget {
  const MercadoListPage({super.key});

  @override
  MercadoListPageState createState() => MercadoListPageState();
}

class MercadoListPageState extends State<MercadoListPage> {
  final ProdutosController produtosController = ProdutosController();
  late Future<List<Produto>> _listaMercado;
  bool _mostrarSomenteNao = false;

  @override
  void initState() {
    super.initState();
    _listaMercado = produtosController.getItems();
  }

  void _chamaitens() {
    setState(() {
      _listaMercado = produtosController.getItems(
          comprado: _mostrarSomenteNao ? true : null);
    });
  }

  void _refreshList() {
    setState(() {
      _listaMercado = produtosController.getItems();
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
          title: Text(item == null ? 'Add Item' : 'Edit Item'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: nome,
                  decoration: const InputDecoration(labelText: 'Nome'),
                  onSaved: (value) => nome = value!,
                ),
                TextFormField(
                  initialValue: quantidade.toString(),
                  decoration: const InputDecoration(labelText: 'Quantidade'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) => quantidade = int.parse(value!),
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
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  final newItem = Produto(
                    id: item?.id,
                    nome: nome,
                    quantidade: quantidade,
                    comprado: comprado,
                  );
                  if (item == null) {
                    produtosController
                        .addItem(newItem)
                        .then((_) => _refreshList());
                  } else {
                    produtosController
                        .updateItem(newItem)
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
        title: const Text('Lista Mercado'),
        actions: [
          Switch(
            value: _mostrarSomenteNao,
            onChanged: (value) {
              setState(() {
                _mostrarSomenteNao = value;
                _chamaitens();
              });
            },
            activeColor: Colors.green,
            inactiveThumbColor: Colors.red,
          )
        ],
      ),
      body: FutureBuilder<List<Produto>>(
        future: _listaMercado,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Sem items'));
          }

          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(item.nome),
                subtitle: Text('Quantidade: ${item.quantidade}'),
                trailing: Checkbox(
                  value: item.comprado,
                  onChanged: (value) {
                    setState(() {
                      item.comprado = value!;
                    });
                    produtosController
                        .updateItem(item); //.then((_) => _refreshList());
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
