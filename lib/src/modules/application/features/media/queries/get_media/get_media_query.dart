import 'package:blog/src/modules/application/abstractions/messaging/iquery.dart';

import '../../../../../domain/features/media/models/media.dart';

class GetMediaQuery extends IQuery<Media?> {
  final List<String> extensionesPermitidas;

  const GetMediaQuery(this.extensionesPermitidas);
}
