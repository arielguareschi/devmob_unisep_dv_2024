main() {
  var notas = [9.2, 8.2, 6.4, 4.4, 3.9, 9.9];

  var notasBoasFn = (double nota) => nota >= 7;
  var notasBoas = notas.where(notasBoasFn);
  // filtrar agora somente as notas muito boas,
  // que sao acima de 9.5
  var notasMuitoBoasFn = (double nota) => nota >= 9.5;
  var notasMuitoBoas = notas.where(notasMuitoBoasFn);

  print(notas);
  print(notasBoas);
  print(notasMuitoBoas);
}
