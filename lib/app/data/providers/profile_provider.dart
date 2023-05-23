import 'package:dio/dio.dart';
import 'package:member_apps/app/core/utils/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider {
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

  Future<Response> updateProfile(FormData formData) async {
    await _getToken();
    return await dio.post(
      EndPoint.updateProfile,
      data: formData,
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }

  Future<Response> changePin(FormData formData) async {
    await _getToken();
    return await dio.post(
      EndPoint.changePin,
      data: formData,
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }

  Future<Response> changePass(FormData formData) async {
    await _getToken();
    return await dio.post(
      EndPoint.changePass,
      data: formData,
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }

  Future<Response> fetchVillage() async {
    await _getToken();
    return dio.get(
      EndPoint.village,
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }
}
