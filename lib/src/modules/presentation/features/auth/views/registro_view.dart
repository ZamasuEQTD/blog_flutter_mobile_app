import 'package:blog/src/modules/presentation/features/auth/logic/bloc/registro/registro_bloc.dart';
import 'package:blog/src/modules/presentation/features/auth/views/login_view.dart';
import 'package:blog/src/modules/presentation/features/auth/views/widgets/registro_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RegistroView extends StatelessWidget {
  const RegistroView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegistroBloc(GetIt.instance.get()),
      child: BlocListener<RegistroBloc, RegistroState>(
        listener:_listener,
        child: BlocBuilder<RegistroBloc, RegistroState>(
          builder: _builder,
        ),
      ),
    );
  }

  Widget _builder(BuildContext context, RegistroState state) {
    return PopScope(
      canPop: state is! RegistrandoState,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title: const Text("Registrarse"),
            ),
            body: const RegistroViewBody(),
          ),
          state is RegistrandoState ? const CargandoFill() : Container()
        ],
      ),
    );
  }

  void _listener(BuildContext context, RegistroState state) {
    if(state is RegistroExitosoState) {

    }
  }
}

class RegistroViewBody extends StatelessWidget {
  const RegistroViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 50),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: const ReigstroForm()
      );
  }
}