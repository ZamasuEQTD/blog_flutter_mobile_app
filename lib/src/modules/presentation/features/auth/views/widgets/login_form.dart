
import 'package:blog/src/modules/presentation/features/auth/logic/bloc/login/login_bloc.dart';
import 'package:blog/src/modules/presentation/features/auth/views/widgets/buttons/auth_btn.dart';
import 'package:blog/src/modules/presentation/features/auth/views/widgets/inputs/auth_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
      children: [
        AuthInput(field: "Usuario", controller: TextEditingController()),
        AuthInput(
          margin: const EdgeInsets.symmetric(vertical: 15),
          field: "Contraseña", controller: TextEditingController(), isPassword: true,),
        AuthBtn(
          text: "Iniciar sesión",
          onTap: () {
          _onLogin(context);
        },)
      ],
    ));
  }

  _onLogin(BuildContext context){
    LoginBloc bloc = context.read();
    bloc.add(const Loguearse("",""));
  }
}