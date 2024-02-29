part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class IniciarSession extends AuthEvent {
  final Usuario usuario;

  const IniciarSession(this.usuario);
}

final class CerrarSession extends AuthEvent {
  const CerrarSession();
}
