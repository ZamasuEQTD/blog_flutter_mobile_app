import 'package:blog/src/modules/domain/features/auth/failures/auth_failures.dart';
import 'package:blog/src/modules/domain/features/auth/failures/login_failures.dart';
import 'package:blog/src/modules/domain/features/auth/iauth_repository.dart';
import 'package:blog/src/modules/domain/features/auth/models/usuario.dart';
import 'package:blog/src/modules/application/features/auth/commands/login/login_command.dart';
import 'package:blog/src/modules/application/features/auth/commands/login/login_command_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockUsuariosRepository extends Mock implements IUsuariosRepository {}

class MockUser extends Mock implements Usuario {}

void main() {
  late MockUsuariosRepository mockUsuariosRepository;
  late LoginCommandHandler login;
  MockUser user = MockUser();
  setUp(() {
    mockUsuariosRepository = MockUsuariosRepository();
    login = LoginCommandHandler(mockUsuariosRepository);
  });
  test("Login debe retornar usuario existente failure", () async {
    when(() => mockUsuariosRepository.login("usuarioInexistente", "password"))
        .thenAnswer((_) =>
            Future.value(const Left(LoginFailures.usuarioPasswordIncorrecta)));

    var usuario = await login
        .handle(const LoginCommand("usuarioInexistente", "password"));
    usuario.fold(
        (l) => expect(l, LoginFailures.usuarioPasswordIncorrecta), (r) => fail);
  });

  test("login Succesfully", () async {
    when(() => mockUsuariosRepository.login("usuarioExistente", "password123"))
        .thenAnswer((_) => Future.value(Right(user)));

    var usuario = await login
        .handle(const LoginCommand("usuarioExistente", "password123"));
    usuario.fold((l) => fail("incorrecto"), (r) => expect(r, user));
  });
}
