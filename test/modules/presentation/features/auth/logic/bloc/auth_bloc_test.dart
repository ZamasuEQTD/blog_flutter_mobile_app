import 'package:blog/src/modules/domain/features/auth/models/usuario.dart';
import 'package:blog/src/modules/presentation/features/auth/logic/bloc/auth/auth_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../domain/features/auth/mock/mock_usuario.dart';

void main() {
  group("AuthBloc", () {
    late AuthBloc authBloc;

    setUp(() {
      authBloc = AuthBloc();
    });

    blocTest<AuthBloc, AuthState>(
      'emits [SesionIniciadaState] when MyEvent is added.',
      build: () => authBloc,
      act: (bloc) => bloc.add(IniciarSession(MockUser())),
      expect: () => <AuthState>[SesionIniciadaState(MockUser())],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [SesionIniciadaState] when MyEvent is added.',
      build: () => authBloc,
      setUp: () => {authBloc.add(IniciarSession(MockUser()))},
      act: (bloc) => bloc.add(const CerrarSession()),
      expect: () => <AuthState>[SinSessionState()],
    );
  });
}
