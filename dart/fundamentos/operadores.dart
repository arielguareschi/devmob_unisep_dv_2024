main() {
  // operadores de atribuicao / infix
  double a = 2;
  a = a + 3;
  a += 3; // adicao
  a -= 3; // subtracao
  a *= 3; // multiplicacao
  a /= 5; // divisao
  a %= 2; // mod

  // operadores relacionais / infix
  // que o seu resultado sempre vai ser bool
  print(3 > 2); // maior que
  print(3 >= 3); // maior ou igual que
  print(3 < 4); // menor que
  print(3 <= 5); // menor ou igual que
  print(3 != 3); // diferente
  print(3 == 3); // igualdade
  print(3 == '3'); // ingualdade

  print(2 + 5 > 3 - 1 && 4 + 7 != 7 - 4);

  print(5 & 4);

  // operadores unarios
  int a1 = 3;
  int a2 = 4;

  a1++; // posfix  == a1 = a1 + 1
  --a1; // prefix  == a1 = 1 - a1
  print(a1);

  print(a1++ == --a2);
  print(a1 == a2);

  // Operador unario logico (NOT)
  print(!true);

  // Operador ternario
  bool estaChovendo = false;
  bool estaFrio = true;

  String resultado = estaChovendo && estaFrio ? "Ficar em casa" : "Bora!!!";
  /* isso eh a mesma coisa  que se fosse assim
    if (estaChovendo && estaFrio){
      String resultado = "Ficar em casa";
    } else {
      String resultado = "Bora!!!!";
    }
    O ternario é assim: (if terneiro)
    [CONDICAO] ? [VERDADEIRO] : [FALSO];
  */
  print(estaChovendo && estaFrio ? "Ficar em casa" : "Bora!!");
}
