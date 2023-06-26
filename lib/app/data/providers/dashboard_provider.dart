import 'package:dio/dio.dart';
import 'package:member_apps/app/core/utils/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardProvider {
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

  Future<Response> fetchProfile() async {
    await _getToken();
    return await dio.get(
      EndPoint.profile,
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }

  Future<Response> fetchStore() async {
    return await dio.get(EndPoint.store);
  }

  Future<Response> fetchLottery() async {
    await _getToken();
    return await dio.get(
      EndPoint.lottery,
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }
}
