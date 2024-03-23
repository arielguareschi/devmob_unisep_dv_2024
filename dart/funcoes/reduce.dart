/* reduce.dart 
  a funcao reduce e usada para criar uma nova 
  variavel que ira combinar os elementos de 
  uma lista.
  usando uma funcao com 2 parametro, 
  um acumulador, e outro o proximo da lista.
  retorna o valor acumulado.
*/
main() {
  var alunos = [
    {'nome': 'Tiburso', 'nota': 9.9},
    {'nome': 'Jocasta', 'nota': 8.9},
    {'nome': 'Mariquinha', 'nota': 7.9},
    {'nome': 'Arcineu', 'nota': 6.9},
    {'nome': 'Pafuncio', 'nota': 5.9},
    {'nome': 'Feliz', 'nota': 7.5},
  ];
  // quero saber quais foram as notas
  // maiores do que 7.0
  var aprovados = alunos
      .map((aluno) => aluno['nota'])
      .map((nota) => (nota as double).roundToDouble())
      .where((nota) => nota >= 7.0);

  // agora vou somar todas as notas dos
  // aprovados
  var total = aprovados.reduce((t, a) => t + a);
  print('A media dos aprovados é: ${total / aprovados.length}.');
}
