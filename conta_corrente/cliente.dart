import 'conta.dart';

class Cliente {
  String nomeCorrentista;
  Conta _contaCorrentista;
  Cliente(this._contaCorrentista, {this.nomeCorrentista});
  @override
  String toString() {
    return 'Nome: $nomeCorrentista | Saldo: ${_contaCorrentista.saldo} | Data Criação: ${_contaCorrentista.dataCriacao}';
  }

  Conta get contaCorrentista => _contaCorrentista;
}
