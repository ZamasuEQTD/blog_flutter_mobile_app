import 'package:blog/src/modules/application/abstractions/messaging/icommand_handler.dart';
import 'package:blog/src/modules/application/features/token/commands/set_token/set_token_command.dart';
import 'package:blog/src/modules/domain/features/auth/itoken_repostory.dart';

class SetTokenCommandHandler extends ICommandHandler<SetTokenCommand,void> {
  
  final ITokenRepository _tokenRepository;

  const SetTokenCommandHandler(this._tokenRepository);
  
  @override
  Future<void> handle(SetTokenCommand command) async{
    await _tokenRepository.setActualToken(command.token);
  }
}