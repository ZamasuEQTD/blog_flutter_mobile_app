import 'package:bloc_test/bloc_test.dart';
import 'package:blog/src/modules/domain/features/auth/failures/auth_failures.dart';
import 'package:blog/src/modules/application/features/auth/commands/login/login_command_handler.dart';
import 'package:blog/src/modules/domain/features/auth/failures/login_failures.dart';
import 'package:blog/src/modules/presentation/features/auth/logic/bloc/auth/auth_bloc.dart';
import 'package:blog/src/modules/presentation/features/auth/logic/bloc/login/login_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../application/features/auth/commands/registro_command_test.dart';

void main() {
  group("LoginBloc", () {
    late LoginBloc loginBloc;
    late LoginCommandHandler loginCommandHandler;
    late MockUsuariosRepository mockUsuariosRepository;
    late MockUser mockUser;
    setUp(() {
      mockUser = MockUser();
      mockUsuariosRepository = MockUsuariosRepository();
      loginCommandHandler = LoginCommandHandler(mockUsuariosRepository);
      loginBloc = LoginBloc(loginCommandHandler);
    });
    blocTest<LoginBloc, LoginState>(
      "emit [LogueoFallidoState] cuando el usuario o contraseña es incorrecto",
      build: () => loginBloc,
      setUp: () {
        when(() => mockUsuariosRepository.login("hola", "hola")).thenAnswer(
            (invocation) => Future.value(
                const Left(LoginFailures.usuarioPasswordIncorrecta)));
      },
      act: (bloc) => bloc.add(const Loguearse("hola", "hola")),
      expect: () => const <LoginState>[
        LogueandoState(),
        LogueoFallidoState(LoginFailures.usuarioPasswordIncorrecta)
      ],
    );

    blocTest<LoginBloc, LoginState>(
      "emit [LogueoExitosoState] cuando el login es exitoso",
      build: () => loginBloc,
      setUp: () {
        when(() => mockUsuariosRepository.login("usuario123", "usuario123"))
            .thenAnswer((invocation) => Future.value(Right(mockUser)));
      },
      act: (bloc) => bloc.add(const Loguearse("usuario123", "usuario123")),
      expect: () =>
          <LoginState>[const LogueandoState(), LogueoExitosoState(mockUser)],
    );
  });
}
