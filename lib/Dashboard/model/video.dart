import 'dart:math';

import 'package:sunday/Dashboard/model/video_list.dart';

class Video {
  final int id;
  final String pageURL;
  final String type;
  final List<String> tags;
  final int duration;
  final String picture_id;
  final int views;
  final int downloads;
  final int likes;
  final int comments;
  final int user_id;
  final String user;
  final String userImageURL;
  final VideoList videolist;

  Video(
      {required this.id,
      required this.pageURL,
      required this.type,
      required this.tags,
      required this.duration,
      required this.picture_id,
      required this.views,
      required this.downloads,
      required this.likes,
      required this.comments,
      required this.user_id,
      required this.user,
      required this.userImageURL,
      required this.videolist});

  factory Video.fromJson({required Map<String, dynamic> json}) {
    return Video(
        id: json["id"],
        pageURL: json["pageURL"],
        type: json["type"],
        tags: (json["tags"]?.toString() ?? "")
            .split(",")
            .map((e) => e.trim())
            .toList(),
        duration: json["duration"],
        picture_id: json["picture_id"],
        views: json["views"],
        downloads: json["downloads"],
        likes: json["likes"],
        comments: json["comments"],
        user_id: json["user_id"],
        user: json["user"],
        userImageURL: json["userImageURL"],
        videolist: VideoList.fromJson(json: json["videos"]));
  }
  String get picture {
    return "https://i.vimeocdn.com/video/${picture_id}_960x540.jpg";
  }

  String get title {
    if (tags.isEmpty) {
      return "$type";
    } else if (tags.length == 1) {
      return "${tags[0]} $type";
    } else {
      final random = Random().nextInt(tags.length);
      return "${tags[random]} $type";
    }
  }

  String get videolink {
    if (videolist.medium != null) {
      return videolist.medium!.url;
    } else if (videolist.large != null) {
      return videolist.large!.url;
    } else if (videolist.small != null) {
      return videolist.small!.url;
    } else if (videolist.tiny != null) {
      return videolist.tiny!.url;
    } else
      return "";
  }
}
