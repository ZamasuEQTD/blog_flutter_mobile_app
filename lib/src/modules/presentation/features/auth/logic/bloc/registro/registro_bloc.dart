import 'package:bloc/bloc.dart';
import 'package:blog/src/modules/domain/features/auth/models/usuario.dart';
import 'package:blog/src/modules/domain/shared/failure.dart';
import 'package:blog/src/modules/application/features/auth/commands/registrarse/registrarse_command_handler.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../application/features/auth/commands/registrarse/registrarse_command.dart';

part 'registro_event.dart';
part 'registro_state.dart';

class RegistroBloc extends Bloc<RegistroEvent, RegistroState> {
  final RegistrarseCommandHandler registrarseCommandHandler;
  RegistroBloc(this.registrarseCommandHandler) : super(RegistroInitial()) {
    on<Registrarse>(_onRegistrarse);
  }
  _onRegistrarse(Registrarse event, Emitter<RegistroState> emit) async {
    emit(RegistrandoState());
    var result = await registrarseCommandHandler.handle(RegistrarseCommand(
        event.username, event.password, event.passwordRepetida));

    result.fold((l) => emit(RegistroFallidoState(l)),
        (r) => emit(RegistroExitosoState(r)));
  }
}
