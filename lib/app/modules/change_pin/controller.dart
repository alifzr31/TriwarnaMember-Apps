import 'package:dio/dio.dart' as _dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/core/utils/loading_function.dart';
import 'package:member_apps/app/core/utils/snackbar.dart';
import 'package:member_apps/app/data/providers/profile_provider.dart';

class ChangePinController extends GetxController {
  final ProfileProvider profileProvider;

  ChangePinController({required this.profileProvider});

  final formKey = GlobalKey<FormState>();
  final currentPinController = TextEditingController();
  final newPinController = TextEditingController();
  final confirmPinController = TextEditingController();

  @override
  void onClose() {
    currentPinController.dispose();
    newPinController.dispose();
    confirmPinController.dispose();
    super.onClose();
  }

  void changePin(BuildContext context) async {
    final formData = _dio.FormData.fromMap({
      'current_pin': currentPinController.text,
      'new_pin': newPinController.text,
      'confirm_pin': confirmPinController.text,
    });

    loading(context);

    try {
      final response = await profileProvider.changePin(formData);

      successSnackbar(
          'Change PIN Success', response.data['message'].toString());

      Get.offAllNamed('/dashboard');
    } on _dio.DioError catch (e) {
      Get.back();
      failedSnackbar(
          'Change PIN Failed', e.response!.data['message'].toString());
    }
  }
}
