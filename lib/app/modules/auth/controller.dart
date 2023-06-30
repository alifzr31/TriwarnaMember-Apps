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

  // LOGIN
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // REGISTER
  final fullNameController = TextEditingController();
  final emailRegisController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordRegisController = TextEditingController();
  final idTypeController = TextEditingController();
  final idNumberController = TextEditingController();
  final contactController = TextEditingController();

  // @override
  // void onClose() {
  //   nameController.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }

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

  void register(BuildContext context) async {
    final formData = _dio.FormData.fromMap({
      "full_name": fullNameController.text,
      "email": emailRegisController.text,
      "username": usernameController.text,
      "password": passwordRegisController.text,
      "id_type": idTypeController.text,
      "id_number": idNumberController.text,
      "contact": contactController.text,
    });

    loading(context);

    try {
      print(formData.fields);
    } on _dio.DioError catch (e) {
      print(e);
    } finally {
      await Future.delayed(const Duration(milliseconds: 1000), () {
        Get.back();
      });
    }
  }

  void logout(BuildContext context) async {
    loading(context);

    try {
      final response = await authProvider.logout();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.clear();
      await sharedPreferences.setBool('opened', true);

      print(response.data);

      infoSnackbar('Log Out Success', 'You have been logged out');
      Get.offAllNamed('/dashboard0');
    } on _dio.DioError catch (e) {
      Get.back();
      failedSnackbar('Failed', e.response.toString());
    }
  }
}
