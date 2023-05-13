import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as _dio;
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
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

  void login() async {
    final formData = _dio.FormData.fromMap({
      'username': emailController.text,
      'password': passwordController.text,
    });

    try {
      final response = await authProvider.login(formData);

      if (response.statusCode == 200) {
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString('token', response.data['token']);

        Get.snackbar(
        'Log In Success',
        response.data['message'].toString(),
        icon: const Icon(Icons.check, color: Colors.white, size: 30,),
        backgroundColor: Colors.green.shade800,
        colorText: Colors.white,
      );

        Get.offAllNamed('/dashboard');
      }
    } on _dio.DioError catch (e) {
      Get.snackbar(
        'Log In Failed',
        e.response!.data['message'].toString(),
        icon: const Icon(Iconsax.danger, color: Colors.white, size: 30,),
        backgroundColor: Colors.red.shade800,
        colorText: Colors.white,
      );
    }
  }

  void register(XFile file) async {
    final formData = _dio.FormData.fromMap({
      'nama': nameController.text,
      'file': await _dio.MultipartFile.fromFile(file.path),
    });

    try {
      final response = await authProvider.register(formData);
      print(response);
    } catch (e) {
      print(e);
      print(formData.fields[0]);
    }
  }
}
