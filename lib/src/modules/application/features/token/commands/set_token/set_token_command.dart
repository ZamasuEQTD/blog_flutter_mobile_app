import 'package:blog/src/modules/application/abstractions/messaging/icommand.dart';
import 'package:blog/src/modules/domain/features/auth/models/token.dart';
import 'package:dartz/dartz.dart';

class SetTokenCommand extends ICommand<void> {
  final Token token;

  SetTokenCommand(this.token);
}
