import 'package:blog/src/modules/application/abstractions/messaging/iquery_handler.dart';
import 'package:blog/src/modules/application/features/auth/queries/get_actual_token/get_actual_token_query.dart';
import 'package:blog/src/modules/domain/features/auth/itoken_repostory.dart';
import 'package:blog/src/modules/domain/features/auth/models/token.dart';
import 'package:blog/src/modules/domain/shared/failure.dart';
import 'package:dartz/dartz.dart';

class GetActualTokenQueryHandler extends IQueryHandler<GetActualTokenQuery,  Token?> {
  
  final ITokenRepository _tokenRepository;

  const GetActualTokenQueryHandler(this._tokenRepository);

  @override
  Future<Either<Failure, Token?>> handle(GetActualTokenQuery command) async{
    return Right( await _tokenRepository.getActualToken());
  }
}