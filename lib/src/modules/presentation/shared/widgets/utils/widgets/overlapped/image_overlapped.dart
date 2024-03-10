import 'dart:io';

import 'package:flutter/widgets.dart';

import 'filled_ovelap_widget.dart';

class ImageOverlapped extends StatelessWidget {
  final ImageProvider imageProvider;
  final Widget child;
  final BoxFit? boxFit;

  const ImageOverlapped({
    super.key,
    required this.imageProvider,
    required this.child,
    this.boxFit,
  });

  factory ImageOverlapped.network({
    required String url,
    required Widget child,
    BoxFit? boxFit,
    Key? key,
  }) {
    return ImageOverlapped(
      key: key,
      imageProvider: NetworkImage(url),
      boxFit: boxFit,
      child: child,
    );
  }

  factory ImageOverlapped.file({
    required File file,
    required Widget child,
    BoxFit? boxFit,
    Key? key,
  }) {
    return ImageOverlapped(
      key: key,
      imageProvider: FileImage(file),
      boxFit: boxFit,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FilledOverlapWidget(
        atras: Image(
          image: imageProvider,
          fit: boxFit,
        ),
        child: child);
  }
}
