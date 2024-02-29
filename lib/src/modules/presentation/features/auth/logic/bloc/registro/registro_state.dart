part of 'registro_bloc.dart';

sealed class RegistroState extends Equatable {
  const RegistroState();

  @override
  List<Object> get props => [];
}

final class RegistroInitial extends RegistroState {}

final class RegistrandoState extends RegistroState {}

final class RegistroExitosoState extends RegistroState {
  final Usuario usuario;

  const RegistroExitosoState(this.usuario);
}

final class RegistroFallidoState extends RegistroState {
  final Failure failure;

  const RegistroFallidoState(this.failure);
}
