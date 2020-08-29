import 'package:meta/meta.dart';

enum MediaType {
  image,
  video,
}

class Advance {
  final String url;
  final MediaType media;
  final Duration duration;
  final int posicion;

  const Advance({
    @required this.url,
    @required this.media,
    @required this.duration,
    @required this.posicion,
  });
}
