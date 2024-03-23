/*
 criar uma funcao que execute por X vezes 
 determinada funcao, e seu parametro,
 sendo que sera passado:
 quantas vezes
 qual a funcao
 qual texto do parametro
 deve retornar qual o tamanho do texto.
*/
int executarPor(
  int qtde,
  Function(String) fn,
  String valor,
) {
  String textoCompleto = "";
  for (int i = 0; i < qtde; i++) {
    textoCompleto += fn(valor);
  }
  return textoCompleto.length;
}

main() {
  var meuPrint = (String valor) {
    print(valor);
    return valor;
  };
  int tamanho = executarPor(
    10,
    meuPrint,
    'Teste Teste',
  );
  print('tamanho: $tamanho');
}
