// aqui eh criado uma funcao que depois
// vai ser atribuido para uma variavel
int somaFn(int a, int b) {
  return a + b;
}

main() {
  // cria uma variavel do tipo funcao e
  // atribui para ela uma funcao.
  int Function(int, int) soma1 = somaFn;
  print(soma1(222, 333));

  // aqui cria uma funcao anonima e atribui para a
  // variavel
  var soma2 = ([int x = 1, int y = 1]) {
    return x + y;
  };
  print(soma2(222, 333));

  var nome = () {
    print('Ola pessoa!');
    return true;
  };
  print(nome());

  // arrow function
  var nomeX = () => "teste";
  var adicao = (int a, int b) => a + b;
  var subtracao = (int a, int b) => a - b;
  var multiplicacao = (int a, int b) => a * b;
  var divisao = (int a, int b) => a / b;

  print(nomeX());
}
