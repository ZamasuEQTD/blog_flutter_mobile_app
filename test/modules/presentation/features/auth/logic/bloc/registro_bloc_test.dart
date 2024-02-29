import 'package:bloc_test/bloc_test.dart';
import 'package:blog/src/modules/domain/features/auth/failures/auth_failures.dart';
import 'package:blog/src/modules/domain/features/auth/failures/registro_failures.dart';
import 'package:blog/src/modules/domain/features/auth/models/value_object/password.dart';
import 'package:blog/src/modules/domain/features/auth/models/value_object/username.dart';
import 'package:blog/src/modules/domain/shared/extensions/dartz_extensions.dart';
import 'package:blog/src/modules/application/features/auth/commands/registrarse/registrarse_command_handler.dart';
import 'package:blog/src/modules/presentation/features/auth/logic/bloc/registro/registro_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../application/features/auth/commands/login_command_test.dart';

void main() {
  group("RegistroBloc", () {
    late RegistroBloc registroBloc;
    late RegistrarseCommandHandler registrarseCommandHandler;
    late MockUsuariosRepository mockUsuariosRepository;
    late MockUser mockUser;
    setUp(() {
      mockUser = MockUser();
      mockUsuariosRepository = MockUsuariosRepository();
      registrarseCommandHandler =
          RegistrarseCommandHandler(mockUsuariosRepository);
      registroBloc = RegistroBloc(registrarseCommandHandler);
    });

    blocTest<RegistroBloc, RegistroState>(
      'emit [RegistroFallidoState] cuando las contraseñas no son iguales.',
      build: () => registroBloc,
      act: (bloc) => bloc.add(const Registrarse("usuario", "good", "gool")),
      expect: () => <RegistroState>[
        RegistrandoState(),
        const RegistroFallidoState(RegistroFailures.passwordNoIguales)
      ],
    );

    blocTest<RegistroBloc, RegistroState>(
      'emits [MyState] when MyEvent is added.',
      build: () => registroBloc,
      setUp: () {
        when(() => mockUsuariosRepository.registrarse(
                UserName.create("UsuarioVal").right(),
                Password.create("Password12").right()))
            .thenAnswer((invocation) => Future.value(Right(mockUser)));
      },
      act: (bloc) =>
          bloc.add(const Registrarse("UsuarioVal", "Password12", "Password12")),
      expect: () =>
          <RegistroState>[RegistrandoState(), RegistroExitosoState(mockUser)],
    );
  });
}
