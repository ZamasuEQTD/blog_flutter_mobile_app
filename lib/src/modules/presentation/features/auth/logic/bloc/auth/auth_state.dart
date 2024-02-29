part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class SinSessionState extends AuthState {
  @override
  List<Object> get props => [];
}

final class SesionIniciadaState extends AuthState {
  final Usuario usuario;

  const SesionIniciadaState(this.usuario);
}
