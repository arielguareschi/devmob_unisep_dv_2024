main() {
  var alunos = [
    {'nome': 'Tiburso', 'nota': 9.9},
    {'nome': 'Jocasta', 'nota': 8.9},
    {'nome': 'Mariquinha', 'nota': 7.9},
    {'nome': 'Arcineu', 'nota': 6.9},
    {'nome': 'Pafuncio', 'nota': 5.9},
    {'nome': 'Feliz', 'nota': 7.5},
  ];
  String Function(Map) pegaNomeFn = (aluno) => aluno['nome'];
  int Function(String) qtdLetrasFn = (nome) => nome.length;
  var resultado = alunos.map(pegaNomeFn).map(qtdLetrasFn);

  print(resultado);
  /*
    map - utilizado para criar uma nova lista 
    a partir de uma ja existente, porem aplicando
    uma funcao para fazer algo, como no exemplo 
    acima, uma funcao pega somente os nomes
    no map, e depois conta quantas letras tem 
    cada nome.
  */
}
