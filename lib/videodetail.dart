import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:sunday/Dashboard/model/video.dart';
import 'package:sunday/common/textfield/utils/colors.dart';

class VideoDetailWidget extends StatefulWidget {
  final Video video;
  const VideoDetailWidget({super.key, required this.video});

  @override
  State<VideoDetailWidget> createState() => _VideoDetailWidgetState();
}

class _VideoDetailWidgetState extends State<VideoDetailWidget> {
  late BetterPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final datasource = BetterPlayerDataSource.network(widget.video.videolink,
        qualities: widget.video.videolist.videoquality);

    _controller = BetterPlayerController(
        const BetterPlayerConfiguration(aspectRatio: 16 / 9, autoPlay: true),
        betterPlayerDataSource: datasource);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.bottomcolor,
        ),
        body: Container(
          child: Column(
            children: [
              AspectRatio(
                  aspectRatio: 16 / 9,
                  child: BetterPlayer(
                    controller: _controller,
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(14),
                child: Column(
                  children: [
                    Text(widget.video.title),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Likes: ${widget.video.likes}"),
                        Text("Comments: ${widget.video.comments}"),
                        Text("Downloads: ${widget.video.downloads}"),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
