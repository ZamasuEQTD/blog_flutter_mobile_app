import 'package:blog/src/modules/application/features/media/queries/get_media/get_media_query.dart';
import 'package:blog/src/modules/application/features/media/queries/get_media/get_media_query_handler.dart';
import 'package:blog/src/modules/domain/features/media/failures/media_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../domain/features/media/mock/mock_media_repository.dart';

void main() {
  group("Media QueryHandler Tests", () {
    late MockMediaRepository mockMediaRepository;
    late GetMediaQueryHandler getMediaQueryHandler;
    setUp(() {
      mockMediaRepository = MockMediaRepository();
      getMediaQueryHandler = GetMediaQueryHandler(mockMediaRepository);
    });

    test("debe retornar null cuando no se ha seleccionado un archivo",
        () async {
      when(() => mockMediaRepository.getFile([]))
          .thenAnswer((_) => Future.value(const Right(null)));

      var result = await getMediaQueryHandler.handle(const GetMediaQuery([]));
      result.fold((l) => fail("debería ser null, pero hay un error"),
          (r) => expect(r, null));
    });
    test("debe retornar failure cuando no respeta extension de archivo",
        () async {
      when(() => mockMediaRepository.getFile([])).thenAnswer(
          (_) => Future.value(const Left(MediaFailures.archivoInvalido)));

      var result = await getMediaQueryHandler.handle(const GetMediaQuery([]));
      result.fold((l) => (r) => expect(r, MediaFailures.archivoInvalido),
          (r) => fail("deberia haber un [Failure] pero se completo con éxito"));
    });
    test(
        "debe retornar el archivo cuando es seleccionado y respeta la extension",
        () async {
      when(() => mockMediaRepository.getFile([])).thenAnswer(
          (_) => Future.value(const Left(MediaFailures.archivoInvalido)));

      var result = await getMediaQueryHandler.handle(const GetMediaQuery([]));
      result.fold((l) => (r) => expect(r, MediaFailures.archivoInvalido),
          (r) => fail("deberia haber un [Failure] pero se completo con éxito"));
    });
  });
}
