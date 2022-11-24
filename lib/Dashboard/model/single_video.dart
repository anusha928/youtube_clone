import 'package:flutter/foundation.dart';

class SingleVideo {
  final String url;
  final int height;
  final int width;

  SingleVideo({required this.url, required this.height, required this.width});

  factory SingleVideo.fromJson({required Map<String, dynamic> json}) {
    return SingleVideo(
        url: json["url"], height: json["height"], width: json["width"]);
  }
}
