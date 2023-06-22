import 'package:dio/dio.dart' as _dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:member_apps/app/core/utils/loading_function.dart';
import 'package:member_apps/app/core/utils/snackbar.dart';
import 'package:member_apps/app/data/providers/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final AuthProvider authProvider;

  AuthController({required this.authProvider});

  final formKeyLogin = GlobalKey<FormState>();
  final formKeyRegister = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login(BuildContext context) async {
    final formData = _dio.FormData.fromMap({
      'username': emailController.text,
      'password': passwordController.text,
    });

    loading(context);

    try {
      final response = await authProvider.login(formData);

      if (response.statusCode == 200) {
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString('token', response.data['token']);

        successSnackbar('Log In Success', response.data['message'].toString());

        Get.offAllNamed('/dashboard');
      }
    } on _dio.DioError catch (e) {
      Get.back();
      failedSnackbar('Log In Failed', e.response!.data['message'].toString());
    }
  }

  void register(XFile file) async {
    final fl = await _dio.MultipartFile.fromFile(file.path);

    final formData = _dio.FormData.fromMap({
      'nama': nameController.text,
      'file': await _dio.MultipartFile.fromFile(file.path),
    });

    try {
      final response = await authProvider.register(formData);
      print(response);
    } catch (e) {
      print(e);
      print(formData.fields);
      print(fl.contentType);
    }
  }
}
