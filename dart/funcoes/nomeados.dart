saudarPessoa({String? nome, int? idade}) {
  print('Ola $nome vc tem $idade anos');
}

imprimirData(int dia, {int mes = 1, int ano = 2021}) {
  print('$dia/$mes/$ano');
}

main() {
  imprimirData(
    20,
    mes: 5,
    ano: 2022,
  );
  saudarPessoa(
    idade: 51,
    nome: "Tiburso",
  );
}
