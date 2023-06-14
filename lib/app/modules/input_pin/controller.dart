import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as _dio;
import 'package:icons_plus/icons_plus.dart';
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
      print(e.response?.statusCode.toString());

      Get.snackbar(
        margin: const EdgeInsets.all(10),
        'Redeem Failed',
        e.response.toString(),
        icon: const Icon(
          Iconsax.danger,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Colors.red.shade800.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }
}
