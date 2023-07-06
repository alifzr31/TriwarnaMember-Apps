import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as _dio;
import 'package:member_apps/app/core/utils/loading_function.dart';
import 'package:member_apps/app/core/utils/snackbar.dart';
import 'package:member_apps/app/data/models/village.dart';
import 'package:member_apps/app/data/providers/profile_provider.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';

class ProfileController extends GetxController {
  final ProfileProvider profileProvider;

  ProfileController({required this.profileProvider});

  var isLoading = true.obs;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final birthController = TextEditingController();
  final addressController = TextEditingController();
  final villageController = TextEditingController();
  final idTypeController = TextEditingController();
  final idNumberController = TextEditingController();
  final educationController = TextEditingController();
  final jobController = TextEditingController();
  final birthPlaceController = TextEditingController();
  final religionController = TextEditingController();
  final maritalController = TextEditingController();
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
    idTypeController.dispose();
    idNumberController.dispose();
    educationController.dispose();
    jobController.dispose();
    birthPlaceController.dispose();
    religionController.dispose();
    maritalController.dispose();
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
      failedSnackbar('Failed', e.response.toString());
    }

    update();
  }

  void updateProfile(XFile? file, BuildContext context) async {
    final formData = _dio.FormData.fromMap({
      'name': nameController.text,
      if (file != null) 'image': await _dio.MultipartFile.fromFile(file.path),
      'gender': genderController.text,
      'birth_date': birthController.text,
      'address': addressController.text,
      'village': selectedVillage.value,
      'id_type': idTypeController.text,
      'id_number': idNumberController.text,
      'education': educationController.text,
      'job_code': jobController.text,
      'birth_place': birthPlaceController.text,
      'religion': religionController.text,
      'marital_status': maritalController.text,
    });
    print(formData.fields);

    loading(context);

    try {
      final response = await profileProvider.updateProfile(formData);

      successSnackbar(
          'Update Profile Success', response.data['success'].toString());

      Get.offAllNamed('/dashboard');
      userControl.fetchProfile();
    } on _dio.DioError catch (e) {
      Get.back();
      failedSnackbar('Update Profile Failed', e.response!.data.toString());
    }
  }
}
