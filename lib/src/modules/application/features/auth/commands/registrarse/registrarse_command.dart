import 'package:blog/src/modules/domain/features/auth/models/usuario.dart';
import 'package:dartz/dartz.dart';

import '../../../../abstractions/messaging/icommand.dart';
import '../../../../../domain/shared/failure.dart';

class RegistrarseCommand extends ICommand<Either<Failure, Usuario>> {
  final String usuario;
  final String password;
  final String passwordReptida;
  const RegistrarseCommand(this.usuario, this.password, this.passwordReptida);
}
