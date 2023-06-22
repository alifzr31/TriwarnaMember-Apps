import 'package:dio/dio.dart' as _dio;
import 'package:get/get.dart';
import 'package:member_apps/app/core/utils/snackbar.dart';
import 'package:member_apps/app/data/providers/input_pin_provider.dart';

class InputPinController extends GetxController {
  final InputPinProvider inputPinProvider;

  InputPinController({required this.inputPinProvider});

  void redeemPoint(String prizeCode) async {
    final formData = _dio.FormData.fromMap({
      'prize_code': prizeCode,
    });

    try {
      final response = await inputPinProvider.redeemPoint(formData);
      print(response.statusMessage);
    } on _dio.DioError catch (e) {
      failedSnackbar('Redeem Failed', e.response.toString());
    }
  }
}
