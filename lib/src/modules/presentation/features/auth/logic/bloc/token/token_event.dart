part of 'token_bloc.dart';

sealed class TokenEvent extends Equatable {
  const TokenEvent();

  @override
  List<Object> get props => [];
}


final class CargarActualToken extends TokenEvent {}

final class DelActualToken extends TokenEvent {}

final class SetActualToken extends TokenEvent {
  final Token token;

  const SetActualToken(this.token);
}

