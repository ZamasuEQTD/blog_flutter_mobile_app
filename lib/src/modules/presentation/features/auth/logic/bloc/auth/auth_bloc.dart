import 'package:bloc/bloc.dart';
import 'package:blog/src/modules/domain/features/auth/models/usuario.dart';
import 'package:equatable/equatable.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(SinSessionState()) {
    on<IniciarSession>(_onIniciarSession);
    on<CerrarSession>(_onCerrarSesion);
  }

  _onIniciarSession(IniciarSession event, Emitter<AuthState> emit) {
    emit(SesionIniciadaState(event.usuario));
  }

  _onCerrarSesion(CerrarSession event, Emitter<AuthState> emit) {
    emit(SinSessionState());
  }
}
