Object segundoElementoV1(List lista) {
  return lista.length >= 2 ? lista[1] : null;
}

E? segundoElementoV2<E>(List<E> lista) {
  return lista.length >= 2 ? lista[1] : null;
}

main() {
  var lista = [3, 6, 7, 8, 9, 12, 14];
  print(segundoElementoV1(lista));

  int segEl = segundoElementoV2<int>(lista)!;

  segEl = segundoElementoV2(lista)!;
  print(segEl);
}
