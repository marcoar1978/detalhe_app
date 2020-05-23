class Produto {
  int produtoId;
  String nome;
  double valor;
  int padraoPrazoEntrega;
  int listaId;

  Produto();

  @override
  String toString() {
    return 'Produto{produtoId: $produtoId, nome: $nome, valor: $valor}';
  }

  Produto.fromMap(Map<String, dynamic> produtoMap)
      : this.produtoId = produtoMap['produtoId'],
        this.nome = produtoMap['nome'],
        this.valor = produtoMap['valor'],
        this.padraoPrazoEntrega = produtoMap['padraoPrazoEntrega'],
        this.listaId = produtoMap['listaId'];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> produtoMap = Map();
    produtoMap['produtoId'] = this.produtoId;
    produtoMap['nome'] = this.nome;
    produtoMap['valor'] = this.valor;
    produtoMap['padraoPrazoEntrega'] = this.padraoPrazoEntrega;
    produtoMap['listaId'] = this.listaId;
  }
}
