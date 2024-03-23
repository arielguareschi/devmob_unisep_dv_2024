/*
Alterar as funcoes para que usem return e NAO
o print.
*/
import 'dart:math';

main() {
  somaComPrint(5, 11);
  somaDoisNumeroQualquer();
}

void somaComPrint(int a, int b) {
  print(a + b);
}

void somaDoisNumeroQualquer() {
  int n1 = Random().nextInt(11);
  int n2 = Random().nextInt(11);
  print('Foi gerado: $n1 e $n2');
  print(n1 + n2);
}
