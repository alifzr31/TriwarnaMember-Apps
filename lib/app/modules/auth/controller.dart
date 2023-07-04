import 'package:dio/dio.dart' as _dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:member_apps/app/core/utils/loading_function.dart';
import 'package:member_apps/app/core/utils/snackbar.dart';
import 'package:member_apps/app/data/providers/auth_provider.dart';
import 'package:member_apps/app/modules/auth/verify/view.dart';
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
  final passwordRegisController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final contactController = TextEditingController();

  // VERIFY
  final email = ''.obs;
  var isLoading = false.obs;
  var hasSent = false.obs;

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

      if (response.data['verify'] == '0') {
        Get.back();
        infoSnackbar('Akun Belum Aktif', response.data['message']);
        Get.offAndToNamed('/verify', arguments: response.data['email']);
      } else {
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
      "name": fullNameController.text,
      "email": emailRegisController.text,
      "password": passwordRegisController.text,
      "password_confirmation": passwordConfirmController.text,
      "phone_number": contactController.text,
    });

    loading(context);

    try {
      final response = await authProvider.register(formData);

      if (response.data['verify'] == 0) {
        Get.back();
      successSnackbar('Registrasi Berhasil',
          'Registrasi sudah berhasil, Silahkan verifikasi akun anda');
        Get.offAndToNamed('/verify', arguments: emailRegisController.text);
      }
    } on _dio.DioError catch (e) {
      Get.back();

      if (e.response!.statusCode == 422) {
        if (e.response?.data['email'] != null &&
            e.response?.data['phone_number'] != null) {
          infoSnackbar(
              'Ubah Inputan Anda', 'Email dan No. Telepon sudah digunakan');
        } else if (e.response?.data['email'] != null &&
            e.response?.data['phone_number'] == null) {
          infoSnackbar('Ubah Inputan Anda', 'Email sudah digunakan');
        } else if (e.response?.data['email'] == null &&
            e.response?.data['phone_number'] != null) {
          infoSnackbar('Ubah Inputan Anda', 'No. Telepon sudah digunakan');
        }
      } else {
        failedSnackbar('Failed', e.response.toString());
      }
    }
  }

  void verifyEmail() async {
    final formData = _dio.FormData.fromMap({
      "email": email.value,
    });

    isLoading.value = true;

    try {
      final response = await authProvider.verifyEmail(formData);
      print(response);
    } on _dio.DioError catch (e) {
      failedSnackbar('Failed', e.response.toString());
    } finally {
      isLoading.value = false;
      hasSent.value = true;
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
