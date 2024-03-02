import 'package:bloc/bloc.dart';
import 'package:blog/src/modules/application/features/media/queries/get_media/get_media_query.dart';
import 'package:blog/src/modules/application/features/media/queries/get_media/get_media_query_handler.dart';
import 'package:blog/src/modules/domain/features/media/models/media.dart';
import 'package:blog/src/modules/domain/shared/failure.dart';
import 'package:equatable/equatable.dart';

part 'seleccion_de_media_event.dart';
part 'seleccion_de_media_state.dart';

class SeleccionDeMediaBloc
    extends Bloc<SeleccionDeMediaEvent, SeleccionDeMediaState> {
  final List<String> extensiones;
  final GetMediaQueryHandler getMediaQueryHandler;
  SeleccionDeMediaBloc(this.getMediaQueryHandler, this.extensiones)
      : super(SinMediaSeleccionadaState()) {
    on<EliminarMediaEvent>(_onEliminarMedia);
    on<CargarMediaEvent>(_onCargarMedia);
  }

  void _onEliminarMedia(
      EliminarMediaEvent event, Emitter<SeleccionDeMediaState> emit) {
    emit(SinMediaSeleccionadaState());
  }

  void _onCargarMedia(
      CargarMediaEvent event, Emitter<SeleccionDeMediaState> emit) async {
    final mediaResult =
        await getMediaQueryHandler.handle(GetMediaQuery(extensiones));

    mediaResult.fold((l) => emit(MediaSeleccionadaFailureState(l)), (r) {
      if (r != null) {
        emit(MediaSeleccionadaState(r));
      } else {
        emit(SinMediaSeleccionadaState());
      }
    });
  }
}
