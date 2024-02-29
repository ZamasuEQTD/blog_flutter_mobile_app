import 'package:blog/src/modules/domain/features/auth/failures/auth_failures.dart';
import 'package:blog/src/modules/domain/features/auth/failures/registro_failures.dart';
import 'package:blog/src/modules/domain/features/auth/models/usuario.dart';
import 'package:blog/src/modules/domain/shared/extensions/dartz_extensions.dart';
import 'package:dartz/dartz.dart';

import '../../../../abstractions/messaging/icommand_handler.dart';
import '../../../../../domain/features/auth/iauth_repository.dart';
import '../../../../../domain/features/auth/models/value_object/password.dart';
import '../../../../../domain/features/auth/models/value_object/username.dart';
import '../../../../../domain/shared/failure.dart';
import 'registrarse_command.dart';

class RegistrarseCommandHandler
    extends ICommandHandler<RegistrarseCommand, Either<Failure, Usuario>> {
  final IUsuariosRepository _usuariosRepository;

  const RegistrarseCommandHandler(this._usuariosRepository);

  @override
  Future<Either<Failure, Usuario>> handle(RegistrarseCommand command) async {
    if (command.password != command.passwordReptida) {
      return const Left(RegistroFailures.passwordNoIguales);
    }
    var userNameResult = UserName.create(command.usuario);
    if (userNameResult.isLeft()) {
      return Left(userNameResult.left());
    }
    var passwordResult = Password.create(command.password);
    if (passwordResult.isLeft()) {
      return Left(passwordResult.left());
    }
    return _usuariosRepository.registrarse(
        userNameResult.right(), passwordResult.right());
  }
}
