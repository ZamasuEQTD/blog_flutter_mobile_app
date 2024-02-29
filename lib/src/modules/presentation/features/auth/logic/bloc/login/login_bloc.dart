import 'package:bloc/bloc.dart';
import 'package:blog/src/modules/domain/features/auth/models/usuario.dart';
import 'package:blog/src/modules/domain/shared/failure.dart';
import 'package:blog/src/modules/application/features/auth/commands/login/login_command.dart';
import 'package:blog/src/modules/application/features/auth/commands/login/login_command_handler.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginCommandHandler loginCommandHandler;
  LoginBloc(this.loginCommandHandler) : super(LoginInitial()) {
    on<Loguearse>(_onLoguearse);
  }

  _onLoguearse(Loguearse event, Emitter<LoginState> emit) async {
    emit(const LogueandoState());
    var result = await loginCommandHandler
        .handle(LoginCommand(event.username, event.password));

    result.fold(
        (l) => emit(LogueoFallidoState(l)), (r) => emit(LogueoExitosoState(r)));
  }
}
