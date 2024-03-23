import 'dart:io';

main() {
  print("Digite o nome:");
  String teste = stdin.readLineSync()!;
  print("Digite o salario:");
  String? teste2 = stdin.readLineSync();
  // ! garante que nao vai ter null
  // ? a variavel pode ser nula
  print(teste);
  print(teste2);
}
