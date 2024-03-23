import 'dart:math';

void executar({
  required Function fnPar,
  required Function fnImpar,
}) {
  var sorteado = Random().nextInt(100);
  print('Foi sorteado $sorteado');
  sorteado % 2 == 0 ? fnPar() : fnImpar();
}

main() {
  var minhaFnPar = () => print('É par!');
  //var minhaFnImpar = () => print('É impar!');
  executar(
    fnPar: minhaFnPar,
    fnImpar: () => print('É impar!'),
  );
}
