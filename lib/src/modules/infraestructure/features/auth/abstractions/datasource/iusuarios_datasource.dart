import 'package:dartz/dartz.dart';

import '../../../../../domain/features/auth/models/usuario.dart';
import '../../../../../domain/features/auth/models/value_object/password.dart';
import '../../../../../domain/features/auth/models/value_object/username.dart';
import '../../../../../domain/shared/failure.dart';

abstract class IUsuariosDatasource {
  Future<Either<Failure, Usuario>> registrarse(UserName userName, Password password);
  
  Future<Either<Failure, Usuario>> login(String userName, String password);
}