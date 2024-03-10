import 'package:blog/src/modules/domain/shared/failure.dart';
import 'package:dartz/dartz.dart';

import 'models/media.dart';

abstract class IMediaRepository {
  Future<Either<Failure, ArchivoLocal?>> getFile(List<String> extensionesPermitidas);
  Future<Either<Failure, List<ArchivoLocal>>> getFiles(List<String> extensionesPermitidas, int maximaCantidadDeArchivos);
}
