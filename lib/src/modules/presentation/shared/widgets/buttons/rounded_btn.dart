import 'package:flutter/material.dart';

class RoundedIconBtn extends StatelessWidget {
  final Widget icon;
  final Color color;
  final Size? size;
  final void Function()? onTap;
  const RoundedIconBtn(
      {super.key,
      required this.icon,
      this.size,
      this.onTap,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedIcon(
        size: size ?? const Size(50, 50),
        icon: icon,
        color: color,
      ),
    );
  }
}

class RoundedIcon extends StatelessWidget {
  final Widget icon;
  final Size size;
  final Color color;
  const RoundedIcon({
    super.key,
    this.size = const Size(50, 50),
    required this.icon,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: Container(
      width: size.width,
      height: size.height,
      padding: const EdgeInsets.all(10),
      color: color,
      child: icon,
    ));
  }
}
