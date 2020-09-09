var data =
    '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';

class Conta {
  double saldo;
  String _dataCriacao;
  Conta(this._dataCriacao, {this.saldo = 0});

  String get dataCriacao => _dataCriacao;
  depositar(valorDeposito) {
    if (valorDeposito < 0) {
      print('Valor inválido.');
    } else {
      saldo += valorDeposito;
    }
  }

  sacar(valorSaque) {
    if (valorSaque > saldo || saldo - valorSaque < 0 || valorSaque < 0) {
      print('Você não possui saldo ou quer sacar um valor inválido.');
    } else {
      saldo -= valorSaque;
    }
  }
}
