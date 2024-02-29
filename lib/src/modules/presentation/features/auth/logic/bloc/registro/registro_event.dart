part of 'registro_bloc.dart';

sealed class RegistroEvent extends Equatable {
  const RegistroEvent();

  @override
  List<Object> get props => [];
}

final class Registrarse extends RegistroEvent {
  final String username;
  final String password;
  final String passwordRepetida;
  const Registrarse(this.username, this.password, this.passwordRepetida);
}
