import 'package:flutter/material.dart';

class BotonConTexto extends StatelessWidget {
  final String txt;
  final void Function()? onTap;
  final Color? color;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final double borderRadius;
  final double? height;
  const BotonConTexto({
    super.key,
    required this.txt,
    this.color,
    this.onTap,
    this.textStyle,
    this.backgroundColor = Colors.white,
    this.borderRadius = 20, this.height
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(fontWeight: FontWeight.w600, color: color)
                .merge(textStyle),
          ),
        ),
      ),
    );
  }
}
