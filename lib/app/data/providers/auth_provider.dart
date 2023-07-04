import 'package:dio/dio.dart';
import 'package:member_apps/app/core/utils/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider {
  final dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl));
  var token;

  _getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    token = _prefs.getString('token');
  }

  _setHeaders() => {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

  Future<Response> login(FormData formData) async {
    return await dio.post(EndPoint.login, data: formData);
  }

  Future<Response> register(FormData formData) async {
    return await dio.post(EndPoint.register, data: formData);
  }

  Future<Response> verifyEmail(FormData formData) async {
    return await dio.post(EndPoint.verifyEmail, data: formData);
  }

  Future<Response> logout() async {
    await _getToken();
    return await dio.post(
      EndPoint.logout,
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }
}
