part of 'token_bloc.dart';

sealed class TokenState extends Equatable {
  const TokenState();
  
  @override
  List<Object> get props => [];
}

final class SinTokenState extends TokenState {}

final class TokenEliminadoState extends TokenState {}

final class ConTokenState extends TokenState {
  final Token token;
  const ConTokenState(this.token );
}
