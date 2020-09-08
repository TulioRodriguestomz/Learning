class ContaCorrente {
  String nomeCorrentista;
  double saldoCorrentista;
  ContaCorrente({this.nomeCorrentista, this.saldoCorrentista = 0});
  @override
  String toString() {
    return 'Nome: $nomeCorrentista | Saldo: $saldoCorrentista';
  }

  adicionarSaldo({deposito}) => saldoCorrentista += deposito;
  sacar({saque}) => saldoCorrentista -= saque;
}
