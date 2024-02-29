part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class Loguearse extends LoginEvent {
  final String username;
  final String password;

  const Loguearse(this.username, this.password);
}
