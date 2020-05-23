

class Protetico{
  int id;
  String nome;

  Protetico();

  @override
  String toString() {
    return 'Protetico{id: $id, nome: $nome}';
  }

  Protetico.fromMap(Map<String, dynamic> proteticoMap):
      this.id = proteticoMap['id'],
      this.nome = proteticoMap['nome'];

  Map<String, dynamic> toMap(){
    Map<String, dynamic> proteticoMap = Map<String, dynamic>();
    proteticoMap['id'] = this.id;
    proteticoMap['nome'] = this.nome;
    return proteticoMap;
  }


}