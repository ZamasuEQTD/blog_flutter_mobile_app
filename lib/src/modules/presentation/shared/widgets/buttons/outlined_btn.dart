import 'package:flutter/material.dart';

class OutlinedTextBtn extends StatelessWidget {
  final void Function()? onTap;
  final Color? color;
  final double? width;
  final TextStyle? textStyle;
  final String txt;
  const OutlinedTextBtn({
    super.key,
    this.onTap,
    this.color,
    required this.txt,
    this.width,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color ?? Colors.white, width: 1)),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(color: color ?? Colors.white).merge(textStyle),
          ),
        ),
      ),
    );
  }
}
