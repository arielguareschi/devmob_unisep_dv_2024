/* segundo.dart
 Crie uma aplicação dart que possua 
 o nome da pessoa, valor do salario e 
calcule qual é o % de inss que deve pagar
sendo que para isso considere o valor 
fixo de 9,67%, ao final exiba qual sera o
valor a ser recebido pela pessoa.
*/
main() {
  String nome = "Tibursso de Lá";
  double salario = 1500.0;
  double per_inss = 9.67;
  double vlr_inss = salario * per_inss / 100;
  double receber = salario - vlr_inss;
// AGORA PRECISA CALCULAR O VALOR DO IR QUE SERA
// DESCONTADO DO FUNCIONARIO, USE O % DE 27,5%,
// A BASE DE CALCULO DO IR É O SALÁRIO JÁ
// DESCONTADO O INSS
  print("${nome} - \n VLR: ${receber}");
}
