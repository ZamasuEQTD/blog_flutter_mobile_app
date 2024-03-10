import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlatInput extends StatelessWidget {
  final int? minLines;
  final int? maxLines;
  final Widget? label;
  final double? borderRadius;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final Color? fillColor;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? textInputType;
  final void Function(String value)? onChanged;
  final String? initialValue;
  const FlatInput(
      {super.key,
      this.borderRadius,
      this.minLines,
      this.maxLines = 1,
      this.controller,
      this.hintText,
      this.suffixIcon,
      this.textInputType,
      this.onChanged,
      this.obscureText,
      this.onFieldSubmitted,
      this.initialValue,
      this.label,
      this.fillColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 20),
        child: TextFormField(
          minLines: minLines,
          controller: controller,
          maxLines: maxLines,
          onChanged: onChanged,
          maxLength: 400,
          obscureText: obscureText ?? false,
          keyboardType: textInputType,
          decoration: InputDecoration(
              label: label,
              counterText: "",
              suffixIcon: suffixIcon,
              hintText: hintText,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              fillColor: fillColor,
              filled: true),
          initialValue: initialValue,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ),
    );
  }
}

class FlatPasswordInput extends StatefulWidget {
  final double? borderRadius;
  final TextEditingController? controller;
  final String? hintText;
  final void Function(String)? onChanged;
  const FlatPasswordInput(
      {super.key,
      this.controller,
      this.hintText,
      this.onChanged,
      this.borderRadius});

  @override
  State<FlatPasswordInput> createState() => _FlatPasswordInputState();
}

class _FlatPasswordInputState extends State<FlatPasswordInput> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return FlatInput(
        borderRadius: widget.borderRadius,
        obscureText: obscureText,
        onChanged: widget.onChanged,
        controller: widget.controller,
        hintText: widget.hintText,
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
                obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash)));
  }
}
