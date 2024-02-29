import 'package:blog/src/modules/domain/features/auth/failures/auth_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/failure.dart';

class Password extends Equatable {
  static const int maxLenght = 12;
  static const int minLenght = 8;

  final String value;

  const Password._(this.value);

  static Either<Failure, Password> create(String password) {
    var failure = _valid(password);
    if (failure != null) {
      return Left(failure);
    }
    return Right(Password._(password));
  }

  static Failure? _valid(String password) {
    if (password.isEmpty) {
      return AuthFailures.passwordVacia;
    }
    if (password.length < minLenght || password.length > maxLenght) {
      return AuthFailures.largoDePasswordInvalida;
    }
    return null;
  }

  static bool isValid(String password) {
    return _valid(password) != null;
  }

  @override
  List<Object?> get props => [value];
}
