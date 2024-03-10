import 'package:flutter/material.dart';

class FlatIconBtn extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final void Function()? onTap;
  const FlatIconBtn({super.key, required this.icon, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          color: color,
          height: 50,
          width: 50,
          child: Icon(
            icon,
            size: 25,
          ),
        ),
      ),
    );
  }
}
