import 'package:blog/src/modules/application/abstractions/messaging/icommand.dart';
import 'package:blog/src/modules/domain/shared/failure.dart';
import 'package:dartz/dartz.dart';

class DelActualTokenCommand extends ICommand<Either<Failure,void>> {}