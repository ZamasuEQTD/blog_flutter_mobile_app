import 'package:blog/src/modules/domain/features/auth/models/token.dart';
import 'package:blog/src/modules/domain/features/auth/models/usuario.dart';
import 'package:mocktail/mocktail.dart';

class MockUser extends Mock implements Usuario {}

class MockToken extends Mock implements Token {}

