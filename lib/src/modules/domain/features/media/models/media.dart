abstract class Media {
  final String path;

  const Media({required this.path});
}

class Video extends Media {
  const Video({required super.path});
}

class Imagen extends Media {
  const Imagen({required super.path});
}

class ArchivoLocal {
  final Media media;

  ArchivoLocal(this.media);
}
