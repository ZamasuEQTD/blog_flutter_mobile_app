import 'package:blog/src/modules/domain/features/auth/models/usuario.dart';
import 'package:dartz/dartz.dart';

import '../../shared/failure.dart';
import 'models/value_object/password.dart';
import 'models/value_object/username.dart';

abstract class IUsuariosRepository {
  Future<Either<Failure, Usuario>> registrarse(UserName userName, Password password);
  
  Future<Either<Failure, Usuario>> login(String userName, String password);
}
