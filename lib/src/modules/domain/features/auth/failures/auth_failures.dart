import 'package:blog/src/modules/domain/features/auth/models/value_object/password.dart';
import 'package:blog/src/modules/domain/features/auth/models/value_object/username.dart';
import 'package:blog/src/modules/domain/shared/failure.dart';

class AuthFailures {
  static const Failure largoDeNombreDeUsuarioInvalido = Failure(
      "El nombre de usuario debe tener entre ${UserName.minLenght} y ${UserName.maxLenght}");

  static const Failure nombreDeUsuarioVacio =
      Failure("Nombre de usuario no puede estar vacio");

  static const Failure passwordVacia =
      Failure("Nombre de usuario no puede estar vacio");

  static const Failure largoDePasswordInvalida = Failure(
      "La contraseña debe tener entre ${Password.minLenght} y ${Password.maxLenght}");
}
