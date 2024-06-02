import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/transacao.dart';

class TransacaoController {
  final String baseUrl = "https://despesas-e602a-default-rtdb.firebaseio.com/";
  final List<Transacao> _transacoes = [];

  Future<List<Transacao>> getTransacoes() async {
    final response = await http.get(Uri.parse('$baseUrl/transacoes.json'));
    _transacoes.clear();
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      if (response.body != "null") {
        Map<String, dynamic> data = jsonDecode(response.body);
        data.forEach((transacaoId, transacao) {
          _transacoes.add(
            Transacao(
              id: transacaoId,
              titulo: transacao['titulo'],
              data: DateTime.parse(transacao['data']),
              valor: transacao['valor'],
            ),
          );
        });
      }
      return _transacoes;
    } else {
      throw Exception("Erro ao obter transacoes");
    }
  }

  Future<void> addTransacao(Transacao item) async {
    final response = await http.post(Uri.parse('$baseUrl/transacoes.json'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(item.toJson()));
    if (response.statusCode != 200) {
      throw Exception('Erro ao adicionar item');
    }
  }

  Future<void> updateItem(Transacao item) async {
    final response = await http.put(
      Uri.parse('$baseUrl/transacoes/${item.id}.json'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(item.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao atualizar item');
    }
  }

  Future<void> deleteItem(String id) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/transacoes/$id.json'));

    if (response.statusCode != 200) {
      throw Exception('Erro ao deletar item');
    }
  }
}
