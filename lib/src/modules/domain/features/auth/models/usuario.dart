class Usuario {
  final String id;
  final String userName;
  final RangoDeUsuario rango;

  bool get esModerador => rango == RangoDeUsuario.moderador;

  Usuario({required this.id, required this.userName, required this.rango});
}


enum RangoDeUsuario {
  usuario,
  moderador
}