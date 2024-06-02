class Transacao {
  final String id;
  final String titulo;
  final double valor;
  final DateTime data;

  Transacao({
    required this.id,
    required this.titulo,
    required this.valor,
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'valor': valor,
      'data': data.toString(),
    };
  }
}
