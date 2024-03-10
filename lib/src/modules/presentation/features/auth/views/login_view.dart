
import 'package:blog/src/modules/application/features/auth/commands/login/login_command_handler.dart';
import 'package:blog/src/modules/domain/features/auth/failures/auth_failures.dart';
import 'package:blog/src/modules/infraestructure/features/auth/usuarios_repository.dart';
import 'package:blog/src/modules/presentation/features/auth/logic/bloc/login/login_bloc.dart';
import 'package:blog/src/modules/presentation/features/auth/views/widgets/login_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(GetIt.instance.get()),
      child: BlocListener<LoginBloc, LoginState>(
        listener: _listener,
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: _builder,
        ),
      ),
    );
  }

  Widget _builder(BuildContext context, LoginState state) {
    return PopScope(
      canPop: state is! LogueandoState,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title: const Text("Iniciar sesión"),
            ),
            body: const LoginViewBody(),
          ),
          state is LogueandoState ? const CargandoFill() : Container()
        ],
      ),
    );
  }

  void _listener(BuildContext context, LoginState state) {
    if(state is LogueoExitosoState) {

    }
  }
}

class CargandoFill extends StatelessWidget {
  const CargandoFill({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Container(
      color: const Color.fromRGBO(00, 0, 0, 0.4),
      child: const Center(
        child: CircularProgressIndicator(
          color: CupertinoColors.activeBlue,
        ),
      ),
    ));
  }
}
class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 50),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: const LoginForm());
  }
}
