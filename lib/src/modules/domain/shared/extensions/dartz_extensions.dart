import 'package:dartz/dartz.dart';

extension EitherX<L, R> on Either<L, R> {
  R right() => (this as Right).value; //
  L left() => (this as Left).value;
}
