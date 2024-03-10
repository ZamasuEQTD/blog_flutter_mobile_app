import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/widgets/overlapped/filled_ovelap_widget.dart';

class BlurEffectWidget extends StatelessWidget {
  final Widget? child;
  const BlurEffectWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10, tileMode: TileMode.decal),
      child: Container(
        color: Colors.black.withOpacity(0.6),
        child: child,
      ),
    );
  }
}

class BlurearWidget extends StatelessWidget {
  final Widget child;
  const BlurearWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return FilledOverlapWidget(atras: const BlurEffectWidget(), child: child);
  }
}
