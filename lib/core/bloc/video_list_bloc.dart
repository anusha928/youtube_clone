import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunday/core/model/video.dart';
import 'package:sunday/core/resources/video_repositry.dart';
import 'package:sunday/core/cubit/common_event.dart';
import 'package:sunday/core/cubit/common_state.dart';

class VideoListBloc extends Bloc<CommomEvent, CommonState> {
  final VideoRepository videoRepository;
  VideoListBloc({required this.videoRepository}) : super(Commoninitial()) {
    on<CommonDataFetcheEvent>((event, emit) async {
      emit(Commonloading());
      final res = await videoRepository.fetchvideos(query: event.query);
      if (res.status && res.data != null) {
        emit(CommonDatafetch<List<Video>>(items: res.data!));
      } else {
        emit(Commonerror(message: res.message));
      }
    });
  }
}
