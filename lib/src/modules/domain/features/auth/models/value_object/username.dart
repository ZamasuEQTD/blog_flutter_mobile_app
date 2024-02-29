import 'package:blog/src/modules/domain/features/auth/failures/auth_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/failure.dart';

class UserName extends Equatable {
  static const int maxLenght = 12;
  static const int minLenght = 8;

  final String value;

  const UserName._(this.value);

  static Either<Failure, UserName> create(String username) {
    if (username.isEmpty) {
      return const Left(AuthFailures.nombreDeUsuarioVacio);
    }
    if (username.length < minLenght || username.length > maxLenght) {
      return const Left(AuthFailures.largoDeNombreDeUsuarioInvalido);
    }
    return Right(UserName._(username));
  }

  @override
  List<Object?> get props => [value];
}
