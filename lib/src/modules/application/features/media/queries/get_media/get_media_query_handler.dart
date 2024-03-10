import 'package:blog/src/modules/application/abstractions/messaging/iquery_handler.dart';
import 'package:blog/src/modules/application/features/media/queries/get_media/get_media_query.dart';
import 'package:blog/src/modules/domain/features/media/imedia_repository.dart';
import 'package:blog/src/modules/domain/shared/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../../domain/features/media/models/media.dart';

class GetMediaQueryHandler extends IQueryHandler<GetMediaQuery, ArchivoLocal?> {
  final IMediaRepository _mediaRepository;

  const GetMediaQueryHandler(this._mediaRepository);

  @override
  Future<Either<Failure, ArchivoLocal?>> handle(GetMediaQuery command) {
    return _mediaRepository.getFile(command.extensionesPermitidas);
  }
}
