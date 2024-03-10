import 'package:blog/src/modules/domain/features/auth/iauth_repository.dart';
import 'package:blog/src/modules/domain/features/auth/models/usuario.dart';
import 'package:blog/src/modules/domain/features/auth/models/value_object/password.dart';
import 'package:blog/src/modules/domain/features/auth/models/value_object/username.dart';
import 'package:blog/src/modules/domain/shared/failure.dart';
import 'package:blog/src/modules/infraestructure/features/auth/abstractions/datasource/iusuarios_datasource.dart';
import 'package:dartz/dartz.dart';

class UsuariosRepository extends IUsuariosRepository {
  final IUsuariosDatasource datasource;

  UsuariosRepository(this.datasource);
  @override
  Future<Either<Failure, Usuario>> login(String userName, String password) {
    return datasource.login(userName, password);
  }

  @override
  Future<Either<Failure, Usuario>> registrarse(UserName userName, Password password) {
      return datasource.registrarse(userName, password);
  }
  
}