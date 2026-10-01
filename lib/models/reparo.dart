class Reparo {
  final double valor;
  final int ordemServico;

  Reparo(this.valor, this.ordemServico);

  @override
  String toString() {
    return 'Reparo{valor: $valor, ordemServico: $ordemServico}';
  }
}
