import 'package:blog/src/modules/application/abstractions/messaging/icommand_handler.dart';
import 'package:blog/src/modules/application/features/token/commands/del_actual_token/del_actual_token_command.dart';
import 'package:blog/src/modules/domain/features/auth/itoken_repostory.dart';
import 'package:blog/src/modules/domain/shared/failure.dart';
import 'package:dartz/dartz.dart';

class DelActualTokenCommandHandler extends ICommandHandler<DelActualTokenCommand,Either<Failure,void>> {
  final ITokenRepository _tokenRepository;

  DelActualTokenCommandHandler(this._tokenRepository); 
  
  @override
  Future<Either<Failure, void>> handle(DelActualTokenCommand command) async {
    return Right( await _tokenRepository.delActualToken());
  }
  
}