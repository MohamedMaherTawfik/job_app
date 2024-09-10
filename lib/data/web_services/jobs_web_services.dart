import 'package:dio/dio.dart';
import 'package:jobs_app/constants/strings.dart';

class JobsWebServices {
  late Dio dio;
  JobsWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: base_url,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllJobs() async {
    try {
      Response response = await dio.get('');
      print(response.data['jobs']);
      return response.data['jobs'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
