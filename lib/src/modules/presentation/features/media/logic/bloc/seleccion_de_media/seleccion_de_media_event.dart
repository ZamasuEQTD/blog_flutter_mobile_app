part of 'seleccion_de_media_bloc.dart';

sealed class SeleccionDeMediaEvent extends Equatable {
  const SeleccionDeMediaEvent();

  @override
  List<Object> get props => [];
}

class CargarMediaEvent extends SeleccionDeMediaEvent {}

class EliminarMediaEvent extends SeleccionDeMediaEvent {}
