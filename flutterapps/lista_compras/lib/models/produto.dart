class Produto {
  final String? id;
  final String nome;
  final int quantidade;
  bool comprado;

  Produto({
    this.id,
    required this.nome,
    required this.quantidade,
    required this.comprado,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'quantidade': quantidade,
      'comprado': comprado,
    };
  }
}
