import 'package:flutter/widgets.dart';

class FilledOverlapWidget extends StatelessWidget {
  final double height;
  final double width;
  final Widget atras;
  final Widget child;
  const FilledOverlapWidget(
      {super.key,
      this.height = double.infinity,
      this.width = double.infinity,
      required this.atras,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [Positioned.fill(child: atras), child],
      ),
    );
  }
}
