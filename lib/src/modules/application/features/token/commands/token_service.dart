import 'package:blog/src/modules/domain/features/auth/models/usuario.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenService  {
  Usuario getUsuario(String token) {
    Map<String, dynamic> info = JwtDecoder.decode(token);
    return Usuario(
      id: info["id"],
      userName: info["user_name"],
      rango: RangoDeUsuario.values[info["rango"]]
      );
  }
}