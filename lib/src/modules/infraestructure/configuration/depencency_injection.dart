import 'package:blog/src/modules/application/features/auth/commands/login/login_command_handler.dart';
import 'package:blog/src/modules/application/features/auth/commands/registrarse/registrarse_command_handler.dart';
import 'package:blog/src/modules/domain/features/auth/iauth_repository.dart';
import 'package:blog/src/modules/infraestructure/core/url.dart';
import 'package:blog/src/modules/infraestructure/features/auth/abstractions/datasource/iusuarios_datasource.dart';
import 'package:blog/src/modules/infraestructure/features/auth/datasource/usuarios_dio_datasource.dart';
import 'package:blog/src/modules/infraestructure/features/auth/usuarios_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

extension InfraestructureDependencies on GetIt {
  GetIt addInfraestructure() {
    _addDio()
    ._addUserDependencies();
    return this;
  }

  GetIt _addDio() {
    registerLazySingleton(() => Dio(BaseOptions(baseUrl:UrlsProvider.baseUrl)));
    return this;
  }

  GetIt _addUserDependencies() {
    registerLazySingleton<IUsuariosDatasource>(() => UsuariosDioDatasource(get()));
    registerLazySingleton<IUsuariosRepository>(() => UsuariosRepository(get()));
    return this;
  }
}