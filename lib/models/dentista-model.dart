class Dentista {
  int id;
  int clinicaId;
  String nome;

  Dentista();

  @override
  String toString() {
    return 'Dentista{id: $id, clinicaId: $clinicaId, nome: $nome}';
  }

  Dentista.fromMap(Map<String, dynamic> dentistaMap)
      : this.id = dentistaMap['id'],
        this.clinicaId = dentistaMap['clinicaId'],
        this.nome = dentistaMap['nome'];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> dentistaMap = Map<String, dynamic>();
    dentistaMap['id'] = this.id;
    dentistaMap['clinicaId'] = this.clinicaId;
    dentistaMap['nome'] = this.nome;
    return dentistaMap;
  }
}
