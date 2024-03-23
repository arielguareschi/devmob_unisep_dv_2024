List<E> filtrar<E>(
  List<E> lista,
  bool Function(E) fn,
) {
  List<E> listaFiltrada = [];
  for (E e in lista) {
    if (fn(e)) {
      listaFiltrada.add(e);
    }
  }
  return listaFiltrada;
}

main() {
  var nome = [
    'Ana',
    'Angelo',
    'Jennifer',
    'Diego',
    'Bornais',
    'Cleones',
    'Alan',
    'Emanuel',
    'Gustavo',
    'Slickman',
    'Pedro',
    'Larissa',
    'Tiburso',
    'Jocasta',
  ];

  var nGrandeFn = (String nome) => nome.length > 5;
  var lista = nome.where(nGrandeFn);
  print(filtrar(nome, nGrandeFn));
}
