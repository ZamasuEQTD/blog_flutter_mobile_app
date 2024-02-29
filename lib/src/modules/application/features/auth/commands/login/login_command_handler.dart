import 'package:blog/src/modules/domain/features/auth/models/usuario.dart';
import 'package:dartz/dartz.dart';

import '../../../../abstractions/messaging/icommand_handler.dart';
import '../../../../../domain/features/auth/iauth_repository.dart';
import '../../../../../domain/shared/failure.dart';
import 'login_command.dart';

class LoginCommandHandler
    extends ICommandHandler<LoginCommand, Either<Failure, Usuario>> {
  final IUsuariosRepository _usuariosRepository;

  const LoginCommandHandler(this._usuariosRepository);

  @override
  Future<Either<Failure, Usuario>> handle(LoginCommand command) async {
    return _usuariosRepository.login(command.userName, command.password);
  }
}
