import 'package:dio/dio.dart';

class TipsApi {
  final Dio dio = Dio();
  final baseUrl = 'https://62b809d5f4cb8d63df57c091.mockapi.io/healthy';

  Future<Response> getTipsData() async {
    Response response = await dio.get(baseUrl);
    return response;
  }
}
