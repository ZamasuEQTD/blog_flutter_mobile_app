import 'package:blog/src/modules/domain/features/auth/failures/auth_failures.dart';
import 'package:blog/src/modules/domain/features/auth/failures/registro_failures.dart';
import 'package:blog/src/modules/domain/features/auth/models/value_object/password.dart';
import 'package:blog/src/modules/domain/features/auth/models/value_object/username.dart';
import 'package:blog/src/modules/domain/shared/extensions/dartz_extensions.dart';
import 'package:blog/src/modules/application/features/auth/commands/registrarse/registrarse_command.dart';
import 'package:blog/src/modules/application/features/auth/commands/registrarse/registrarse_command_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../domain/features/auth/mock/mock_usuario.dart';
import '../../../../domain/features/auth/mock/mock_usuarios_repository.dart';

void main() {
  late MockUsuariosRepository mockUsuariosRepository;
  late RegistrarseCommandHandler registrarseCommandHandler;
  MockUser user = MockUser();
  setUp(() {
    mockUsuariosRepository = MockUsuariosRepository();
    registrarseCommandHandler =
        RegistrarseCommandHandler(mockUsuariosRepository);
  });
  test("Registro debe fallar por longitud de nombre invalido", () async {
    var usuarioResult = await registrarseCommandHandler.handle(
        const RegistrarseCommand("usuarioInexistente", "password", "password"));

    usuarioResult.fold(
        (l) => expect(AuthFailures.largoDeNombreDeUsuarioInvalido, l),
        (r) => fail("failed"));
  });
  test("Registro debe fallar por nombre vacio", () async {
    var usuarioResult = await registrarseCommandHandler
        .handle(const RegistrarseCommand("", "password", "password"));

    usuarioResult.fold((l) => expect(AuthFailures.nombreDeUsuarioVacio, l),
        (r) => fail("failed"));
  });
  test("Debe fallar por contraseñas no iguales", () async {
    var usuarioResult = await registrarseCommandHandler
        .handle(const RegistrarseCommand("jejejegoood", "pasword12345", "a"));

    usuarioResult.fold((l) => expect(RegistroFailures.passwordNoIguales, l),
        (r) => fail("Se Ha creado el usuario"));
  });
  test("registro exitoso", () async {
    when(() => mockUsuariosRepository.registrarse(
            UserName.create("jejejegoood").right(),
            Password.create("pasword12345").right()))
        .thenAnswer((_) => Future.value(Right(user)));

    var usuarioResult = await registrarseCommandHandler.handle(
        const RegistrarseCommand(
            "jejejegoood", "pasword12345", "pasword12345"));

    usuarioResult.fold((l) => fail("failed"), (r) => expect(user, r));
  });
}
