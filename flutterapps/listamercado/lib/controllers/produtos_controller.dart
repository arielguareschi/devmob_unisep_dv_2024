import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:listamercado/models/produto_model.dart';

class ProdutosController {
  final String baseUrl =
      'https://teste-ariel-66bc7-default-rtdb.firebaseio.com/';
  final List<Produto> _items = [];

  Future<List<Produto>> getItems({bool? comprado}) async {
    final response = await http.get(Uri.parse('$baseUrl/items.json'));
    _items.clear();
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      bool filtraDados = false;
      if (comprado != null) filtraDados = true;

      data.forEach((productId, productData) {
        bool mostraDados = true;
        if (filtraDados) {
          if (productData['comprado']) {
            mostraDados = false;
          }
        }
        if (mostraDados) {
          _items.add(
            Produto(
              id: productId,
              nome: productData['nome'],
              quantidade: productData['quantidade'],
              comprado: productData['comprado'], // ?? false,
            ),
          );
        }
      });
      return _items;
    } else {
      throw Exception('Erro ao chamar os itens');
    }
  }

  Future<void> addItem(Produto item) async {
    final response = await http.post(
      Uri.parse('$baseUrl/items.json'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(item.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao adicionar item');
    }
  }

  Future<void> updateItem(Produto item) async {
    final response = await http.put(
      Uri.parse('$baseUrl/items/${item.id}.json'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(item.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao atualizar item');
    }
  }

  Future<void> deleteItem(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/items/$id.json'));

    if (response.statusCode != 200) {
      throw Exception('Erro ao deletar item');
    }
  }
}
