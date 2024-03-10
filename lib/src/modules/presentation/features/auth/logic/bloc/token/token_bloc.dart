import 'package:bloc/bloc.dart';
import 'package:blog/src/modules/application/features/token/commands/del_actual_token/del_actual_token_command.dart';
import 'package:blog/src/modules/application/features/token/commands/del_actual_token/del_actual_token_command_handler.dart';
import 'package:blog/src/modules/application/features/token/commands/set_token/set_token_command.dart';
import 'package:blog/src/modules/application/features/token/commands/set_token/set_token_command_handler.dart';
import 'package:blog/src/modules/application/features/auth/queries/get_actual_token/get_actual_token_query.dart';
import 'package:blog/src/modules/application/features/auth/queries/get_actual_token/get_actual_token_query_handler.dart';
import 'package:blog/src/modules/domain/features/auth/models/token.dart';
import 'package:equatable/equatable.dart';

part 'token_event.dart';
part 'token_state.dart';

class TokenBloc extends Bloc<TokenEvent, TokenState> {
  final GetActualTokenQueryHandler _getActualTokenQuery;
  final SetTokenCommandHandler _setTokenCommandHandler;
  final DelActualTokenCommandHandler _delActualTokenCommandHandler;
  TokenBloc(
    this._getActualTokenQuery,
    this._delActualTokenCommandHandler,
    this._setTokenCommandHandler
  ) : super(SinTokenState()) {
    on<CargarActualToken>(_onCargarActualToken);
    on<DelActualToken>(_onDelActualToken);
    on<SetActualToken>(_onSetActualToken);
  }

  _onCargarActualToken(CargarActualToken event, Emitter<TokenState> emit )async {
    var result =  await _getActualTokenQuery.handle(GetActualTokenQuery());

    result.fold((l) => null, (r) => {
      if(r != null) {
        emit(ConTokenState(r))
      }
    });
  }

  _onDelActualToken(DelActualToken event, Emitter<TokenState> emit) async {
    var result = await _delActualTokenCommandHandler.handle(DelActualTokenCommand());

    result.fold((l) => null, (r) {
      emit(SinTokenState());
    });
  }

  _onSetActualToken(SetActualToken event, Emitter<TokenState> emit) async {
    await _setTokenCommandHandler.handle(SetTokenCommand(event.token));

    emit(ConTokenState(event.token));
  }
}
