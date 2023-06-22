import 'package:dio/dio.dart' as _dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/core/utils/loading_function.dart';
import 'package:member_apps/app/core/utils/snackbar.dart';
import 'package:member_apps/app/data/providers/profile_provider.dart';

class ChangePassController extends GetxController {
  final ProfileProvider profileProvider;

  ChangePassController({required this.profileProvider});

  final formKey = GlobalKey<FormState>();
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  void changePass(BuildContext context) async {
    final formData = _dio.FormData.fromMap({
      'current_password': currentPassController.text,
      'new_password': newPassController.text,
      'confirm_password': confirmPassController.text,
    });

    loading(context);

    try {
      final response = await profileProvider.changePass(formData);

      successSnackbar(
          'Change Password Success', response.data['message'].toString());

      Get.offAllNamed('/dashboard');
    } on _dio.DioError catch (e) {
      Get.back();
      failedSnackbar(
          'Change Password Failed', e.response!.data['message'].toString());
    }
  }
}
