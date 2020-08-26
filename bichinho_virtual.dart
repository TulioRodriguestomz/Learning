/*
Classe Bichinho Virtual Atributos: Nome, Fome, Saúde e Idade b. 
Métodos:[Alterar Nome, Fome, Saúde e Idade];[Retornar Nome, Fome, Saúde e Idade]
Obs: Existe mais uma informação que devemos levar em consideração, 
o Humor do nosso tamagushi, este humor é uma combinação entre os atributos 
Fome e Saúde, ou seja, um campo calculado, então não devemos criar um atributo
para armazenar esta informação por que ela pode ser calculada a qualquer momento.
*/
import 'dart:io';

class BichinhoVirtual {
  String nome;
  int saude, idade, humor, fome, morte;
  BichinhoVirtual(this.nome,
      [this.fome = 0,
      this.idade = 0,
      this.saude = 25,
      this.humor = 25,
      this.morte = 0]);

  void passarAnos() {
    if (humor >= 50 && humor <= 99 && saude >= 40 && saude <= 99) {
      idade = idade + 1;
    }
  }

  bool condMorte() {
    if ((humor < 0 || humor > 100) ||
        ((saude < 0 || saude > 100)) ||
        ((fome < 0 || fome > 10))) {
      morte = morte + 1;
    }
    if (morte == 5) {
      print('-------------------------------------------');
      print('--@@ SEU BICHINHO ACABA DE MORRER @@--');
      print('Nome: $nome | Fome: $fome | Saude: $saude | Idade: $idade');
    }
    return false;
  }

  void dormir() {
    fome = fome + 80;
    saude = saude + 10;
    humor = humor + 5;
  }

  void mostrarAFome() => print(fome);
  void mostrarSaude() => print(saude);
  void alterarNome(String novoNome) => nome = novoNome;
  void alimentar(int quantidade) {
    saude = saude + (quantidade * 10);
    humor = (quantidade * 2) - humor;
  }

  void brincar(int qntBrincar) {
    saude = saude + (qntBrincar * 2);
    humor = humor + (qntBrincar * 10);
    fome = (qntBrincar * 5) - fome;
  }

  @override
  String toString() {
    return 'Nome: $nome | Fome: $fome | Saude: $saude | Idade: $idade';
  }
}

void main() {
  int escolha = 10;
  print('Bichinho virtual v0.1 -');
  print('Alimente, brinque, veja as infos do seu bicho.');
  print('OBS: Caso HUMOR/FOME/SAUDE for MAIOR que 100 OU menos que 0');
  print('SEU BICHINHO IRÁ MORRER.');
  print('-------------------------------------------');
  print('-@Criação do bichinho virutal@-');
  stdout.write('Digite o nome:');
  var nome1 = stdin.readLineSync();
  print('-------------------------------------------');
  BichinhoVirtual bichinho1 = BichinhoVirtual(nome1);
  print('Seu bichinho virtual está criado e se chama: ' + bichinho1.nome);
  print('-------------------------------------------');
  while (escolha != 0) {
    print('ALTERAR NOME [1] | VER INFOS [2] | ALIMENTAR [3]');
    print('BRINCAR [4] | DORMIR [5] | FINALIZAR [6]');
    print('-@ Escolha uma das opções ACIMA @-');
    print('-------------------------------------------');

    var escolha1 = stdin.readLineSync();
    var escolha = int.parse(escolha1);
    print('-------------------------------------------');

    switch (escolha) {
      case 1:
        stdout.write('Escolha o novo nome para seu Bichinho: ');
        String novoNome = stdin.readLineSync();
        bichinho1.alterarNome(novoNome);
        print('-------------------------------------------');
        break;
      case 2:
        print(bichinho1);
        print('-------------------------------------------');
        break;
      case 3:
        print('-@ Cada 1 ponto de alimento dará 10 de saude. @-');
        print('-@ Porém cada ponto irá descer o HUMOR em 2 @ -');
        stdout.write('Coloque a quantidade entre 1 e 5 para alimentar: ');
        var qntAlimentar1 = stdin.readLineSync();
        int qntAlimentar = int.parse(qntAlimentar1);
        bichinho1.alimentar(qntAlimentar);
        bichinho1.passarAnos();
        print('-------------------------------------------');
        break;
      case 4:
        print('-@ Brincar com seu Bichinho deixa ele com fome @-');
        print('-@ A cada 1 minuto brincado = 5 pontos de fome @-');
        print('-@ Brincar dará 2 de saude para cada minuto brincado @-');
        print('-@ Porém cada minuto dará 10 de humor @-');
        stdout.write('Digite a quantidade entre 1 e 10 MIN para brincar: ');
        var qntBrincar1 = stdin.readLineSync();
        var qntBrincar = int.parse(qntBrincar1);
        bichinho1.brincar(qntBrincar);
        bichinho1.passarAnos();
        print('-------------------------------------------');
        break;
      case 5:
        print('-@ Seu bichinho foi dormir. @-');
        print('-@ Quando BRINCAR/ALIMENTAR/ irá acordar @-');
        bichinho1.dormir();
        print('-------------------------------------------');
        break;
      case 6:
        break;
      default:
        print('Opção inválida');
    }
    if (bichinho1.condMorte() == true) {
      bichinho1.condMorte();
      break;
    }
  }
}
