import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sunday/core/bloc/video_list_bloc.dart';
import 'package:sunday/core/model/video.dart';
import 'package:sunday/core/cubit/common_event.dart';
import 'package:sunday/core/cubit/common_state.dart';
import 'package:sunday/common/textfield/customInputfield.dart';
import 'package:sunday/features/Dashboard/ui/widgets/videodetail.dart';

import 'package:sunday/common/widgets/videocard.dart';

import '../../../../common/utils/colors.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searController = TextEditingController();

  bool isloading = false;
  @override
  void initState() {
    super.initState();
    context.read<VideoListBloc>().add(CommonDataFetcheEvent(query: ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.8,
          //floating: true,
          backgroundColor: AppColors.bottomcolor,
          title: Container(
            //padding: EdgeInsets.all(MediaQuery.of(context).viewPadding.top),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: InputField(
                  textInputAction: TextInputAction.search,
                  hinttext: "search",
                  color: Colors.white,
                  controller: _searController,
                    onSubmit: () {
                    context.read<VideoListBloc>().add(
                        CommonDataFetcheEvent(query: _searController.text));
                  },
                )),
                const SizedBox(
                  width: 4,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: IconButton(
                      iconSize: 29,
                      color: Colors.white,
                      onPressed: () {
                        context.read<VideoListBloc>().add(
                            CommonDataFetcheEvent(query: _searController.text));
                      },
                      icon: const Icon(Icons.search)),
                ),
                Container(
                  margin:const  EdgeInsets.only(top: 16),
                  child: IconButton(
                      iconSize: 29,
                      color: Colors.white,
                      onPressed: () {},
                      icon: const Icon(Icons.library_add)),
                ),
                
              ],
            ),
          )),
      body: Center(
        child: BlocBuilder<VideoListBloc, CommonState>(
          builder: (context, state) {
            if (state is Commonloading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state is Commonerror) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is CommonDatafetch<List<Video>>) {
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: state.items!.length,
                  itemBuilder: (context, index) {
                    return VideoCard(
                      imageurl: state.items![index].picture,
                      title: state.items![index].title,
                      onPressed: () {
                        Navigator.of(context).push(PageTransition(
                            child: VideoDetailWidget(
                              video: state.items![index],
                            ),
                            type: PageTransitionType.fade));
                      },
                    );
                  });
            } else {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
