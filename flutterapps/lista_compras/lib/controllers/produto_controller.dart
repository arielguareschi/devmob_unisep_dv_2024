import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lista_compras/models/produto.dart';

class ProdutoController {
  final String baseUrl = "https://compras-4dcf6-default-rtdb.firebaseio.com/";
  final List<Produto> _items = [];

  Future<List<Produto>> getItems({bool? comprado}) async {
    final response = await http.get(Uri.parse('$baseUrl/items.json'));
    _items.clear();
    if (response.statusCode == 200) {
      if (response.body == "null") {
        return _items;
      }
      Map<String, dynamic> data = jsonDecode(response.body);
      bool filtraDados = false;
      if (comprado != null) filtraDados = true;

      data.forEach((produtoId, produtoData) {
        bool mostraDados = true;
        if (filtraDados) {
          if (produtoData['comprado']) {
            mostraDados = false;
          }
        }
        if (mostraDados) {
          _items.add(Produto(
            id: produtoId,
            nome: produtoData['nome'],
            quantidade: produtoData['quantidade'],
            comprado: produtoData['comprado'],
          ));
        }
      });

      return _items;
    } else {
      throw Exception('Erro ao obter os dados');
    }
  }

  Future<void> addItem(Produto item) async {
    final response = await http.post(
      Uri.parse('$baseUrl/items.json'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(item.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao adicionar item');
    }
  }

  Future<void> updateItem(Produto item) async {
    final response = await http.put(
      Uri.parse('$baseUrl/items/${item.id}.json'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(item.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Erro ao adicionar item');
    }
  }

  Future<void> deleteItem(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/items/$id.json'),
    );
    if (response.statusCode != 200) {
      throw Exception('Erro ao adicionar item');
    }
  }
}
