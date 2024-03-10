import 'package:blog/src/modules/presentation/features/auth/views/widgets/buttons/auth_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'inputs/auth_input.dart';

class ReigstroForm extends StatelessWidget {
  const ReigstroForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        AuthInput(field: "Usuario", controller: TextEditingController()),
        AuthInput(
          field: "Contraseña",
          controller: TextEditingController(),
          isPassword: true,
        ),
        AuthInput(field: "Repetir contraseña", controller: TextEditingController()),
        const AuthBtn(text: "Registrarse")
      ],));
  }
}