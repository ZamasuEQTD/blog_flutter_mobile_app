import '../../../shared/failure.dart';

class RegistroFailures {
  static const Failure usuarioYaExistente = Failure("Usuario ya existente");
  static const Failure passwordNoIguales =
      Failure("Ambas Contraseñas deben ser iguales");
}
