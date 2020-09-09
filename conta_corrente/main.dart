/* Código atualizado para a versão 0.2.1
►Criada a Classe Cliente
►Agora a Classe ContaCorrente se chama Conta, e ela está vínculada 
a Classe Cliente.
►Bugs CONDICIONAIS adicionados aos métodos SACAR e DEPOSITAR
►Adicionado na classe Conta a DATA DE CRIAÇÃO da conta
►Adicionado Lista de Contas em modo TABELA, agora aparece um em baixo do outro
*/
import 'dart:io';
import 'cliente.dart';
import 'conta.dart';

main() {
  Map<int, Cliente> cadastros = {};
  var numeroConta = 0;
  var resposta;
  // var escolha;
  while (resposta != 10) {
    print('--------------------------------------');
    print('--------        Opções        --------');
    print('Adicionar conta[1] | Lista de Contas[2]');
    print('DEPOSITAR[3] | SACAR[4] | Trocar Nome[5]');
    print('             Finalizar[10]              ');
    print('--------------------------------------');
    resposta = int.parse(stdin.readLineSync());
    switch (resposta) {
      case 1:
        print('--------------------------------------');
        stdout.write('NOME: ');
        var nome = stdin.readLineSync();
        stdout.write('SALDO(opcional) Caso não tiver, digite 0: ');
        var saldo = double.parse(stdin.readLineSync());
        stdout.write('Adicionar outra conta?[y=1,n=0]: ');
        resposta = int.parse(stdin.readLineSync());
        cadastros[numeroConta++] =
            Cliente(Conta(data, saldo: saldo), nomeCorrentista: nome);
        print('--------------------------------------');
        break;
      case 2:
        print('--------------------------------------');
        cadastros.forEach((key, value) {
          print('$key $value\n');
        });
        print('--------------------------------------');
        break;
      case 3:
        print('--------------------------------------');
        stdout.write('Digite o NUMERO DA CONTA: ');
        var numeroConta = int.parse(stdin.readLineSync());
        if (cadastros.containsKey(numeroConta)) {
          stdout.write('Digite o Valor do DEPÓSITO: ');
          var valorDeposito = double.parse(stdin.readLineSync());
          cadastros[numeroConta].contaCorrentista.depositar(valorDeposito);
        } else {
          print('Conta inválida!!');
        }
        print('--------------------------------------');
        break;
      case 4:
        print('--------------------------------------');
        stdout.write('Digite o NUMERO DA CONTA: ');
        var numeroConta = int.parse(stdin.readLineSync());
        if (cadastros.containsKey(numeroConta)) {
          stdout.write('Digite o Valor do SAQUE: ');
          var valorSaque = double.parse(stdin.readLineSync());
          cadastros[numeroConta].contaCorrentista.sacar(valorSaque);
        } else {
          print('Conta inválida');
        }
        print('--------------------------------------');
        break;
    }
  }
}
