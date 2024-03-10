import 'package:flutter/material.dart';

import '../../../effects/blur/blur_widget.dart';

class SpoilerWidget extends StatefulWidget {
  final Widget child;
  final String textoDeBoton;
  final bool blurearInitialValue;

  const SpoilerWidget(
      {super.key,
      required this.child,
      this.blurearInitialValue = true,
      this.textoDeBoton = "Ver contenido"});

  @override
  State<SpoilerWidget> createState() => _SpoilerWidgetState();
}

class _SpoilerWidgetState extends State<SpoilerWidget> {
  late bool blurear;

  _SpoilerWidgetState() {
    blurear = widget.blurearInitialValue;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: blurear ? BlurearWidget(child: widget.child) : widget.child,
    );
  }
}
