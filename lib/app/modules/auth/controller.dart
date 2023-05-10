import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as _dio;
import 'package:image_picker/image_picker.dart';
import 'package:member_apps/app/data/providers/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final AuthProvider authProvider;

  AuthController({required this.authProvider});

  final formKey = GlobalKey<FormState>();
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

        Get.offAllNamed('/dashboard');
      } else {
        print([response.statusCode, response.statusMessage]);
      }
    } catch (e) {
      print(e);
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