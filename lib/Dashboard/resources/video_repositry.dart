import 'package:dio/dio.dart';
import 'package:sunday/Dashboard/model/video.dart';
import 'package:sunday/common/model.dart';
import 'package:sunday/constants.dart';

class VideoRepository {
  final List<Video> _videos = [];

  List<Video> get videos => _videos;

  Future<DataResponse<List<Video>>> fetchvideos({String? query}) async {
    try {
      String url = "${Constants.baseurl}/api/videos/?key=${Constants.apikey}";
      if (query != null) {
        url = "$url&q=${query}";
      }
      final response = await Dio().get(url);
      final List<Map<String, dynamic>> tempdata =
          List.from(response.data["hits"])
              .map((e) => Map<String, dynamic>.from(e))
              .toList();
      final items = tempdata.map((e) => Video.fromJson(json: e)).toList();
      _videos.clear();
      _videos.addAll(items);

      return DataResponse.success(data: videos);
    } on DioError catch (e) {
      return DataResponse.error(message: "e.message");
    } catch (e) {
      return DataResponse.error(message: e.toString());
    }
  }
}
