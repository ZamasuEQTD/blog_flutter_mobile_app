part of 'seleccion_de_media_bloc.dart';

sealed class SeleccionDeMediaState extends Equatable {
  const SeleccionDeMediaState();

  @override
  List<Object> get props => [];
}

final class SinMediaSeleccionadaState extends SeleccionDeMediaState {}

final class MediaSeleccionadaState extends SeleccionDeMediaState {
  final Media media;
  const MediaSeleccionadaState(this.media);
}

final class MediaSeleccionadaFailureState extends SeleccionDeMediaState {
  final Failure failure;

  const MediaSeleccionadaFailureState(this.failure);
}
