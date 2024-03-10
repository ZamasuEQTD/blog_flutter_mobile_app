import 'package:blog/src/modules/presentation/shared/widgets/buttons/text_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthBtn extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const AuthBtn({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: BotonConTexto(
          borderRadius: 4,
          height: 45,
          onTap: onTap,
          color: Colors.white,
          textStyle: const TextStyle(fontSize: 18),
          backgroundColor: CupertinoColors.activeBlue,
          txt: text
        ),
    );
  }
}