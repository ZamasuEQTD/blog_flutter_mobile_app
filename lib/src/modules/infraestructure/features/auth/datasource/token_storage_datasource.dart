import 'dart:convert';

import 'package:blog/src/modules/domain/features/auth/models/token.dart';
import 'package:blog/src/modules/infraestructure/features/auth/abstractions/datasource/itoken_datasource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorageDataSource extends ITokenDatasource {
  static const JsonEncoder _encoder = JsonEncoder();
  static const String _keyValue = "token";
  
  final FlutterSecureStorage _storage;

  TokenStorageDataSource(this._storage);

  @override
  Future<void> delActualToken() async {
    await _storage.delete(key: _keyValue);
  }

  @override
  Future<Token?> getActualToken() async  {
    String? token = await  _storage.read(key: _keyValue);
    
    if(token == null) {
      return null;
    }

    Map<String,dynamic> jsonToken = json.decode(token);

    return Token(token: jsonToken["token"], refreshToken: jsonToken["refresh_token"]);
  }

  @override
  Future<void> setActualToken(Token token)async {
    var tokenString = _encoder.convert(token);
    await _storage.write(key: _keyValue, value: tokenString);
  }
  
}