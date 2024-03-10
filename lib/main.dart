import 'package:blog/src/modules/application/features/token/commands/token_service.dart';
import 'package:blog/src/modules/domain/features/auth/models/usuario.dart';
import 'package:blog/src/modules/presentation/core/depencies_injection/dependency_injection.dart';
import 'package:blog/src/modules/presentation/features/auth/logic/bloc/auth/auth_bloc.dart';
import 'package:blog/src/modules/presentation/features/auth/logic/bloc/token/token_bloc.dart';
import 'package:blog/src/modules/presentation/features/auth/views/login_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt getItInstance = GetIt.instance;
void main() {
  GetIt.instance.addDependencies();
  runApp(const BlocAppProvider());
}

class BlocAppProvider extends StatelessWidget {
  const BlocAppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TokenBloc(
            getItInstance.get(),
            getItInstance.get(),
            getItInstance.get()
        )),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class BlocListenerApp extends StatelessWidget {
  const BlocListenerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TokenBloc, TokenState>(
      listener: _listener,
      child: const MyApp(),
    );
  }

  void _listener(BuildContext context, TokenState state) {
    final TokenService tokenService = getItInstance.get();
    final AuthBloc authBloc = context.read();
    Dio dio = getItInstance.get();
    if(state is ConTokenState) {
      dio.options.headers["Authorization"] = state.token;
      authBloc.add(IniciarSession(tokenService.getUsuario(state.token.token)));
    } else if(state is TokenEliminadoState) {
      dio.options.headers.remove("Authorization");
      authBloc.add(const CerrarSession());
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}
