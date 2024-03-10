import 'dart:convert';

import 'package:blog/src/modules/domain/features/auth/itoken_repostory.dart';
import 'package:blog/src/modules/domain/features/auth/models/token.dart';
import 'package:blog/src/modules/infraestructure/features/auth/abstractions/datasource/itoken_datasource.dart';

class GetStorageTokenRepository extends ITokenRepository {
  final ITokenDatasource _datasource;

  GetStorageTokenRepository(this._datasource);


  @override
  Future<void> delActualToken( ) {
    return _datasource.delActualToken( );
  }

  @override
  Future<Token?> getActualToken()async  {
    return _datasource.getActualToken(); 
  }

  @override
  Future<void> setActualToken(Token token)async {
    return _datasource.setActualToken(token);
  }
  
}