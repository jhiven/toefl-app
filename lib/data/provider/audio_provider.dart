import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class AudioProvider {
  late final Dio _dio;

  AudioProvider() {
    _dio = Dio();
  }

  Future<String> downloadAudio({
    required String url,
    required int id,
  }) async {
    final path = p.join((await getTemporaryDirectory()).path, '$id.mp3');
    await _dio.download(url, path);

    return path;
  }
}
