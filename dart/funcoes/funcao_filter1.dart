main() {
  var notas = [9.2, 8.2, 6.4, 4.4, 3.9, 9.9];
  var notasBoas = [];
  // add no notasBoas, todas as notas maiores de 7
  for (var nota in notas) {
    if (nota >= 7.0) {
      notasBoas.add(nota);
    }
  }
  print(notas);
  print(notasBoas);
}
