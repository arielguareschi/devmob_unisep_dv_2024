main() {
  /*
    [] - list posso acessar o elemento 
         pelo indice ex.: lista[1]
    {} - map - conjunto de elementos acessados
         por uma chave unica,
         mapa = {
          'Pessoa1' : "Fulano",
          'Pessoa2' : "Tiburco",
          'Pessoa3' : "Mariquinha",
          'Pessoa1' : "Jocasta"
         }
         e para acessar ex.: mapa['Pessoa1']
    {} - set - é um map somente com as chaves, 
        que não pode ter repetição, nem alteração
        dos dados ex.: times_b = {"inter"}
  */

  // uma lista de aprovados
  var aprovados = [
    'Pessoa1',
    'Pessoa2',
    'Pessoe X',
  ];
  print(aprovados);
  aprovados.add("Pessoa 5");
  print(aprovados.elementAt(2));
  print(aprovados[0]);
  print(aprovados.length);

  var telefones = {
    "Pessoa1": "(46) 1111-1111",
    "Pessoa2": "(46) 1111-1112",
    "Pessoa3": "(46) 1111-1113",
    "Pessoa4": "(46) 1111-1114",
  };

  print(telefones is Map); // qual eh o tipo?
  print(telefones); // imprime tudo
  print(telefones['Pessoa2']); // imp. um elemento
  print(telefones.length); // tamanho
  print(telefones.keys); // chaves
  print(telefones.values); // valores
  print(telefones.entries); // objetos

  // Set
  var times = {
    "Gremio",
    "Vasco",
    "Varmengo",
    "Curintia",
  };
  times.add("Parmeras"); // add elemento
  print(times.length); // tamanho
  print(times.contains("Vasco")); // existe
  print(times.first); // primero
  print(times.last); // ultimo
  print(times); // imprime tudo

  String nome = "teste do nome da pessoa";
  String nome2 = nome.substring(0, 8); // copiar
  String nome3 = nome2.toUpperCase(); // caps look
  String nome4 = nome3.padRight(15, "!"); // preencher ao right
  print(nome4);

  String nome5 =
      "teste do nome da pessoa".substring(0, 8).toUpperCase().padRight(15, '!');

  print(nome5);
}
