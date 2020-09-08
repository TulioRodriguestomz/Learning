import 'dart:io';
import 'contaCorrente.dart';

main() {
  Map<int, ContaCorrente> contas = {};
  var numeroConta = 0;
  var resposta;
  var escolha;
  while (escolha != 00) {
    print('------------------------------------------');
    //Painel de ESCOLHAS
    print('-@ Conta_Corrente v0.1 @-');
    print('-@ Escolha uma das opções abaixo @-');
    print('NOVO CORRENTISTA[1]|LISTA CORRENTISTAS[2]');
    print('DEPOSITAR[3]|SACAR[4]|FINALIZAR[00]');
    print('------------------------------------------');
    resposta = int.parse(stdin.readLineSync());
    //
    switch (resposta) {
      case 1:
        stdout.write('Nome CORRENTISTA: ');
        var nome = stdin.readLineSync();
        stdout.write('Saldo (Opicional|Caso não quiser informar, digite 0): ');
        var saldo = double.parse(stdin.readLineSync());
        stdout.write('Deseja adicionar outro Correntista?[y=1|n=0] ');
        resposta = int.parse(stdin.readLineSync());
        contas[numeroConta++] = ContaCorrente(
          nomeCorrentista: nome,
          saldoCorrentista: saldo,
        );
        print('------------------------------------------');
        break;
      case 2:
        print(contas);
        print('------------------------------------------');
        break;
      case 3:
        stdout.write('Digite o NUMERO DA CONTA: ');
        var numeroConta = int.parse(stdin.readLineSync());
        if (contas.containsKey(numeroConta) == false) {
          print('Conta inválida.');
        } else {
          stdout.write('Digite o valor do DEPOSITO: ');
          var valorDeposito = int.parse(stdin.readLineSync());
          contas[numeroConta].adicionarSaldo(deposito: valorDeposito);
        }
        print('------------------------------------------');
        break;
      case 4:
        stdout.write('Digite o NUMERO DA CONTA: ');
        var numeroConta = int.parse(stdin.readLineSync());
        if (contas.containsKey(numeroConta) == false) {
          print('Conta inválida.');
        } else {
          stdout.write('Digite o valor do SAQUE: ');
          var valorSaque = int.parse(stdin.readLineSync());
          contas[numeroConta].sacar(saque: valorSaque);
        }
        print('------------------------------------------');
        break;
      case 5:
        break;
    }
  }
}
