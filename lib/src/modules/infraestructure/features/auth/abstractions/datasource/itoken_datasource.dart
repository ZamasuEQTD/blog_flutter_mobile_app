import 'package:blog/src/modules/domain/features/auth/models/token.dart';


abstract class ITokenDatasource {
  Future<Token?> getActualToken();
  Future<void> setActualToken(Token token);
  Future<void> delActualToken( );
}