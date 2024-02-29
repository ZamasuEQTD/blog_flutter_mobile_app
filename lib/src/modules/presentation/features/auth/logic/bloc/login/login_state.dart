part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LogueandoState extends LoginState {
  const LogueandoState();
}

final class LogueoExitosoState extends LoginState {
  final Usuario usuario;

  const LogueoExitosoState(this.usuario);
}

final class LogueoFallidoState extends LoginState {
  final Failure failure;

  const LogueoFallidoState(this.failure);
}
