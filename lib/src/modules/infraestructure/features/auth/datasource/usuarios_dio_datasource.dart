import 'package:blog/src/modules/domain/features/auth/models/usuario.dart';
import 'package:blog/src/modules/domain/features/auth/models/value_object/password.dart';
import 'package:blog/src/modules/domain/features/auth/models/value_object/username.dart';
import 'package:blog/src/modules/domain/shared/failure.dart';
import 'package:blog/src/modules/infraestructure/features/auth/abstractions/datasource/iusuarios_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UsuariosDioDatasource extends IUsuariosDatasource {
  final Dio dio;

  UsuariosDioDatasource(this.dio);
  @override
  Future<Either<Failure, Usuario>> login(String userName, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Usuario>> registrarse(UserName userName, Password password) {
    // TODO: implement registrarse
    throw UnimplementedError();
  }
  
}