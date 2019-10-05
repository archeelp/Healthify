import 'package:flutter/foundation.dart';

enum Type {
  Chronic,
  Acute,
  Moderate,
}

class Disease {
  final String id;
  final List<String> cities;
  final String title;
  final String imageUrl;
  final List<String> symptoms;
  final List<String> cure;
  final int duration;
  final Type type;

  const Disease({
    @required this.id,
    @required this.cities,
    @required this.title,
    @required this.imageUrl,
    @required this.symptoms,
    @required this.cure,
    @required this.duration,
    @required this.type,
  });
}
