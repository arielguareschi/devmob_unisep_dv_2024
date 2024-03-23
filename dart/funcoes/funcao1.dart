void saudacao(String nome) {
  print('Ola $nome');
}

void somar(int a, int b) {
  print('A soma de $a e $b é ${a + b}');
}

int quadrado(int x) {
  return x * x;
}

main() {
  saudacao("Tibursio");
  somar(4, 5);
  int xxxx = quadrado(44);
  print("O quadrado de 75 eh: ${quadrado(75)}");
}
