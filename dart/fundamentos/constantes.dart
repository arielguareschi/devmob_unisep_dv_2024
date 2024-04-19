import 'dart:io';

main() {
  const pi = 3.1415926;
  stdout.write("De o raio: ");
  final String entrada = stdin.readLineSync()!;

  final double raio = double.parse(entrada);

  final area = pi * raio * raio;

  print("O raio é ${area}");

  int i = 0;
  double sum = 0.0;
  String s = "";
  bool found = false;

  dynamic qualquer_coisa = "teste";
  qualquer_coisa = 123;

  var teste = "teste";
  // teste = 123;
}
