    import 'package:get_it/get_it.dart';

import '../features/auth/commands/login/login_command_handler.dart';
import '../features/auth/commands/registrarse/registrarse_command_handler.dart';
import '../features/token/commands/del_actual_token/del_actual_token_command_handler.dart';
import '../features/token/commands/set_token/set_token_command_handler.dart';

extension InfraestructureDependencies on GetIt  {

  GetIt addApplication() {
    _addAuthDependencies()
    ._addTokenDependencies();
    return this;
  }

  GetIt _addAuthDependencies() {
    registerLazySingleton(() => LoginCommandHandler(get()));
    registerLazySingleton(() => RegistrarseCommandHandler(get()));
    return this;
  }

  GetIt _addTokenDependencies() {
    registerLazySingleton(() => DelActualTokenCommandHandler(get()));
    registerLazySingleton(() => SetTokenCommandHandler(get()));
    return this;
  }
}