import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/core/utils/loading_function.dart';
import 'package:member_apps/app/core/utils/snackbar.dart';
import 'package:member_apps/app/data/providers/profile_provider.dart';
import 'package:dio/dio.dart' as _dio;

class CreatePinController extends GetxController {
  final ProfileProvider profileProvider;

  CreatePinController({required this.profileProvider});

  final formKey = GlobalKey<FormState>();
  final newPinController = TextEditingController();
  final confirmPinController = TextEditingController();

  void createPin(BuildContext context) async {
    final formData = _dio.FormData.fromMap({
      "new_pin": newPinController.text,
      "confirm_pin": confirmPinController.text,
    });

    loading(context);
    
    try {
      final response = await profileProvider.createPin(formData);
      successSnackbar('Create PIN Success', response.data['message'].toString());

      Get.offAllNamed('/dashboard');
    } on _dio.DioError catch (e) {
      Get.back();
      failedSnackbar('Failed', e.response.toString());
    }
  }
}