class DadosIniciais {
  String dataHoje;
  String nomeUsuario;

  DadosIniciais(this.dataHoje, this.nomeUsuario);

  DadosIniciais.fromMap(Map<String, dynamic> dadosMap)
      : this.dataHoje = dadosMap['dataHoje'],
        this.nomeUsuario = dadosMap['nomeUsuario'];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> dadosMap = Map();
    dadosMap['dataHoje'] = this.dataHoje;
    dadosMap['nomeUsuario'] = this.nomeUsuario;
    return dadosMap;
  }
}
