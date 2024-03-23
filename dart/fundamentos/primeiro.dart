main() {
  print("Ola Mundo");
  int numero = 10;
  int outro = 5;
  double valor = 1.10;
  String nome = "Nome da Pessoa";

  print("Nome: ${nome} - " + " numero: ${numero} - " + "outro: ${outro}");

  // Crie um novo print para exibir
  // o nome e o valor usando interpolacao
  print("Nome: ${nome} - valor ${valor.toStringAsFixed(2)}");
}
