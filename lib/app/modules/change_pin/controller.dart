import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as _dio;
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/core/utils/loading_function.dart';
import 'package:member_apps/app/data/providers/profile_provider.dart';

class ChangePinController extends GetxController {
  final ProfileProvider profileProvider;

  ChangePinController({required this.profileProvider});

  final formKey = GlobalKey<FormState>();
  final currentPinController = TextEditingController();
  final newPinController = TextEditingController();
  final confirmPinController = TextEditingController();

  void changePin(BuildContext context) async {
    final formData = _dio.FormData.fromMap({
      'current_pin': currentPinController.text,
      'new_pin': newPinController.text,
      'confirm_pin': confirmPinController.text,
    });

    loading(context);

    try {
      final response = await profileProvider.changePin(formData);

      Get.snackbar(
        margin: const EdgeInsets.all(10),
        'Change PIN Success',
        response.data['message'].toString(),
        icon: const Icon(
          Icons.check,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Colors.green.shade800,
        colorText: Colors.white,
      );

      Get.offAllNamed('/dashboard');
    } on _dio.DioError catch (e) {
      Get.back();

      Get.snackbar(
        margin: const EdgeInsets.all(10),
        'Change PIN Failed',
        e.response!.data['message'].toString(),
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
