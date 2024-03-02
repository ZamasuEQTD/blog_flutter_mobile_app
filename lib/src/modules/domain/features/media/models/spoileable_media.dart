import 'media.dart';

class SpoileableMedia {
  bool spoiler;
  final Media media;

  SpoileableMedia({required this.media, this.spoiler = false});

  void switchSpoiler() {
    spoiler = !spoiler;
  }
}
