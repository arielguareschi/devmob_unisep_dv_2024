main() {
  List<int> numero = [1, 2, 3, 4, 5];
  List<int> nova1 = [];
  for (int i in numero) {
    nova1.add(i * i);
  }

  var lista2 = numero.map((n1) => n1 * n1).toList();
  print(numero);
  print(nova1);
  print(lista2);
}
