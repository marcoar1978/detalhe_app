class Jwt {
  String token;
  String tipo;

  Jwt(this.tipo, this.token);

  @override
  String toString() {
    return 'Jwt{token: $token, tipo: $tipo}';
  }

  Jwt.fromMap(Map<String, dynamic> jwtMap)
      : this.token = jwtMap['token'],
        this.tipo = jwtMap['tipo'];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> jwtMap = Map();
    jwtMap['token'] = this.token;
    jwtMap['tipo'] = this.tipo;
    return jwtMap;
  }
}
