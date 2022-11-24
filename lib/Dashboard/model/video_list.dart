import 'package:sunday/Dashboard/model/single_video.dart';

class VideoList {
  final SingleVideo? large;
  final SingleVideo? medium;
  final SingleVideo? small;
  final SingleVideo? tiny;

  VideoList(
      {required this.large,
      required this.medium,
      required this.small,
      required this.tiny});

  factory VideoList.fromJson({required Map<String, dynamic> json}) {
    return VideoList(
      large: json["large"] != null
          ? SingleVideo.fromJson(json: json["large"])
          : null,
      medium: json["medium"] != null
          ? SingleVideo.fromJson(json: json["medium"])
          : null,
      small: json["small"] != null
          ? SingleVideo.fromJson(json: json["small"])
          : null,
      tiny: json["tiny"] != null
          ? SingleVideo.fromJson(json: json["tiny"])
          : null,
    );
  }

  Map<String, String> get videoquality {
    Map<String, String> temp = {};
    if (tiny != null) {
      temp["120p"] = tiny!.url;
    }
    if (small != null) {
      temp["240p"] = tiny!.url;
    }
    if (medium != null) {
      temp["380p"] = tiny!.url;
    }
    if (large != null) {
      temp["720p"] = tiny!.url;
    }
    return temp;
  }
}
