import 'package:dartz/dartz.dart';

import '../../../domain/shared/failure.dart';
import 'iquery.dart';

abstract class IQueryHandler<TQuery extends IQuery<TResponse>, TResponse> {
  const IQueryHandler();

  Future<Either<Failure, TResponse>> handle(TQuery command);
}
