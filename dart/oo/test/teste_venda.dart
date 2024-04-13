import '../model/cliente.dart';
import '../model/produto.dart';
import '../model/venda.dart';
import '../model/venda_item.dart';

main() {
  var item1 = VendaItem(
    quantidade: 30,
    produto: Produto(
      codigo: 1,
      nome: 'Apontador AR15',
      preco: 30000,
      desconto: 0.5,
    ),
  );

  var venda = Venda(
    cliente: Cliente(
      nome: "Tiburso",
      cpf: "123.456.789-00",
    ),
    itens: <VendaItem>[
      item1,
      VendaItem(
        quantidade: 20,
        produto: Produto(
          codigo: 123,
          nome: "Bala doce .50",
          preco: 35.01,
          desconto: 0.25,
        ),
      ),
    ],
  );

  print("O total é: R\$ ${venda.valorTotal}");
  print('Primero:${venda.itens[0].produto!.nome}');
  print('CPF: ${venda.cliente!.cpf}');
}
