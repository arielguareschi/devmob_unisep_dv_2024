import 'dart:math';

int numeroAleatorio([int maximo = 10]) {
  return Random().nextInt(maximo);
}

/*
  Crie uma funcao para imprimir 
  DIA/MES/ANO porem somente é obrigatorio que
  o usuario passe para a função a data, mes e 
  Ano são opcionais, e com valor padrao de mes 1 
  e ano 2021
*/
imprimirData(int dia, [int mes = 1, int ano = 2021]) {
  print('$dia/$mes/$ano');
}

main() {
  print(numeroAleatorio(100));
  print(numeroAleatorio());
  imprimirData(10);
  imprimirData(10, 5);
  imprimirData(10, 12, 1991);
}
