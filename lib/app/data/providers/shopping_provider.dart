import 'package:dio/dio.dart';
import 'package:member_apps/app/core/utils/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingProvider {
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

  Future<Response> fetchShopping() async {
    await _getToken();
    return await dio.get(
      EndPoint.shopping,
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }

  Future<Response> fetchShoppingDetail(docnum) async {
    await _getToken();
    return await dio.get(
      EndPoint.shopping+'/$docnum',
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }
}
