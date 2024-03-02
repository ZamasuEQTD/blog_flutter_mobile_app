abstract class Media {
  final String path;

  const Media({required this.path});
}

abstract class ArchivoLocal extends Media {
  final String extension;
  final String nombreDeArchivo;

  const ArchivoLocal(
      {required super.path,
      required this.extension,
      required this.nombreDeArchivo});
}
