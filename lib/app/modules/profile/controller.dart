import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as _dio;
import 'package:member_apps/app/data/models/village.dart';
import 'package:member_apps/app/data/providers/profile_provider.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';

class ProfileController extends GetxController {
  final ProfileProvider profileProvider;

  ProfileController({required this.profileProvider});

  var isLoading = true.obs;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final birthController = TextEditingController();
  final addressController = TextEditingController();
  final villageController = TextEditingController();
  final selectedVillage = ''.obs;

  final userControl = Get.find<DashboardController>();

  var village = <Village>[].obs;

  @override
  void onInit() {
    fetchVillage();
    super.onInit();
  }

  @override
  void onReady() {
    fetchVillage();
    super.onReady();
  }

  @override
  void onClose() {
    village.clear();
    emailController.dispose();
    nameController.dispose();
    genderController.dispose();
    birthController.dispose();
    addressController.dispose();
    villageController.dispose();
    super.onClose();
  }

  void fetchVillage() async {
    try {
      final response = await profileProvider.fetchVillage();
      final List<Village> body = response.data['data'] == null
          ? []
          : listVillageFromJson(jsonEncode(response.data['data']));

      print('response fetch village : ${response.statusCode}');
      village.value = body;

      update();
    } on _dio.DioError catch (e) {
      Get.snackbar(
        'Failed',
        e.response!.statusCode.toString() +
            ' ' +
            e.response!.statusMessage.toString(),
        backgroundColor: Colors.red.shade800,
        colorText: Colors.white,
      );
    }

    update();
  }

  void updateProfile(XFile? file) async {
    final formData = _dio.FormData.fromMap({
      'name': nameController.text,
      if (file != null) 'image': await _dio.MultipartFile.fromFile(file.path),
      'gender': genderController.text,
      'birth_date': birthController.text,
      'address': addressController.text,
      'village': selectedVillage.value
    });

    print(formData.fields[1]);

    try {
      final response = await profileProvider.updateProfile(formData);

      Get.snackbar(
        'Update Profile Success',
        response.data['success'].toString(),
        icon: const Icon(
          Icons.check,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Colors.green.shade800,
        colorText: Colors.white,
      );

      Get.offAndToNamed('/dashboard');
      userControl.fetchProfile();
    } on _dio.DioError catch (e) {
      print(e.response!.statusMessage);
    }
  }
}
