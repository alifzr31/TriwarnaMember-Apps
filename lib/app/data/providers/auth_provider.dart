import 'package:dio/dio.dart';
import 'package:member_apps/app/core/utils/api_url.dart';

class AuthProvider {
  final dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl));

  Future<Response> login(FormData formData) async {
    return await dio.post(EndPoint.login, data: formData);
  }

  Future<Response> register(FormData formData) async {
    return await dio.post(EndPoint.register, data: formData);
  }
}