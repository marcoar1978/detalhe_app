class Clinica {
  int id;
  String nomeSimp;
  int listaId;

  Clinica();

  @override
  String toString() {
    return 'Clinica{id: $id, nomeSimp: $nomeSimp}';
  }

  Clinica.fromMap(Map<String, dynamic> clinicaMap)
      : this.id = clinicaMap['id'],
        this.nomeSimp = clinicaMap['nomeSimp'],
        this.listaId = clinicaMap['listaId'];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> clinicaMap = Map();
    clinicaMap['id'] = this.id;
    clinicaMap['nomeSimp'] = this.nomeSimp;
    clinicaMap['listaId'] = this.listaId;
    return clinicaMap;
  }
}
