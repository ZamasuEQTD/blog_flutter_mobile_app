import 'package:blog/src/modules/domain/features/auth/models/usuario.dart';
import 'package:dartz/dartz.dart';

import '../../../../abstractions/messaging/icommand.dart';
import '../../../../../domain/shared/failure.dart';

class LoginCommand extends ICommand<Either<Failure, Usuario>> {
  final String userName;
  final String password;
  const LoginCommand(this.userName, this.password);
}
