import 'package:flutter/material.dart';

import '../../../../../shared/widgets/text/titulo_global.dart';
import '../../../../../shared/widgets/utils/widgets/inputs/flat_inputs.dart';

class AuthInput extends StatelessWidget {
  final TextEditingController controller;
  final String field;
  final bool isPassword;
  final EdgeInsetsGeometry? margin;
  const AuthInput({super.key, required this.field, required this.controller, this.isPassword = false, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TituloGlobal(txt: field),
          isPassword? 
            FlatPasswordInput(
              borderRadius: 10,
              controller: controller
            )
            :FlatInput(
                  controller: controller,
                  borderRadius: 10,
              )
        ],
      ),
    );
  }
}