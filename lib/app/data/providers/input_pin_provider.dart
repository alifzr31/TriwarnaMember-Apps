import 'package:dio/dio.dart';
import 'package:member_apps/app/core/utils/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputPinProvider {
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

  Future<Response> redeemPoint(FormData formData) async {
    await _getToken();
    return dio.post(
      EndPoint.redeemPoint,
      data: formData,
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }
}
