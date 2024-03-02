import 'package:bloc_test/bloc_test.dart';
import 'package:blog/src/modules/application/features/media/queries/get_media/get_media_query_handler.dart';
import 'package:blog/src/modules/domain/features/media/failures/media_failures.dart';
import 'package:blog/src/modules/presentation/features/media/logic/bloc/seleccion_de_media/seleccion_de_media_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../domain/features/media/mock/mock_media.dart';
import '../../../domain/features/media/mock/mock_media_repository.dart';

void main() {
  group("seleccion_de_media_bloc_tests", () {
    late SeleccionDeMediaBloc seleccionDeMediaBloc;
    late GetMediaQueryHandler getMediaQueryHandler;
    late MockMediaRepository mockMediaRepository;
    late MockArchivoLocal mockArchivoLocal;
    setUp(() {
      mockArchivoLocal = MockArchivoLocal();
      mockMediaRepository = MockMediaRepository();
      getMediaQueryHandler = GetMediaQueryHandler(mockMediaRepository);
      seleccionDeMediaBloc =
          SeleccionDeMediaBloc(getMediaQueryHandler, ["mp3"]);
    });
    blocTest<SeleccionDeMediaBloc, SeleccionDeMediaState>(
      'emits [MyState] when MyEvent is added.',
      build: () => seleccionDeMediaBloc,
      act: (bloc) => bloc.add(CargarMediaEvent()),
      setUp: () {
        when(
          () => mockMediaRepository.getFile(seleccionDeMediaBloc.extensiones),
        ).thenAnswer((invocation) => Future.value(const Right(null)));
      },
      expect: () => <SeleccionDeMediaState>[SinMediaSeleccionadaState()],
    );

    blocTest<SeleccionDeMediaBloc, SeleccionDeMediaState>(
      'emite [MediaSeleccionadaFailureState] cuando el archivo es invalido.',
      build: () => seleccionDeMediaBloc,
      act: (bloc) => bloc.add(CargarMediaEvent()),
      setUp: () {
        when(
          () => mockMediaRepository.getFile(seleccionDeMediaBloc.extensiones),
        ).thenAnswer((invocation) =>
            Future.value(const Left(MediaFailures.archivoInvalido)));
      },
      expect: () => <SeleccionDeMediaState>[
        const MediaSeleccionadaFailureState(MediaFailures.archivoInvalido)
      ],
    );

    blocTest<SeleccionDeMediaBloc, SeleccionDeMediaState>(
      'emite [MediaSeleccionadaState] cuando el archivo es valido.',
      build: () => seleccionDeMediaBloc,
      act: (bloc) => bloc.add(CargarMediaEvent()),
      setUp: () {
        when(
          () => mockMediaRepository.getFile(seleccionDeMediaBloc.extensiones),
        ).thenAnswer((invocation) => Future.value(Right((mockArchivoLocal))));
      },
      expect: () =>
          <SeleccionDeMediaState>[MediaSeleccionadaState(mockArchivoLocal)],
    );
  });
}
