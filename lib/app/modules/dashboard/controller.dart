import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/core/utils/snackbar.dart';
import 'package:member_apps/app/data/models/store.dart';
import 'package:member_apps/app/data/models/user.dart';
import 'package:member_apps/app/data/providers/dashboard_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {
  final DashboardProvider dashboardProvider;

  DashboardController({required this.dashboardProvider});

  var isLoading = true.obs;
  var user = Rx<User?>(null);
  var store = <Store>[].obs;
  final token = ''.obs;

  @override
  void onInit() async {
    fetchProfile();
    fetchStore();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token_access = sharedPreferences.getString('token');
    token.value = token_access.toString();
    super.onInit();
  }

  @override
  void onReady() {
    fetchProfile();
    fetchStore();
    super.onReady();
  }

  @override
  void onClose() {
    store.clear();
    // user.close();
    // store.close();
    super.onClose();
  }

  void fetchProfile() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.getString('token') != null) {
      try {
        final response = await dashboardProvider.fetchProfile();

        if (response.statusCode == 200) {
          user.value = userFromJson(jsonEncode(response.data));

          update();
        } else {
          failedSnackbar(
              'Failed',
              response.statusCode.toString() +
                  ' ' +
                  response.statusMessage.toString());
        }
      } on DioError catch (e) {
        failedSnackbar('Failed', e.response!.data.toString());
      }

      isLoading.value = false;
      update();
    } else {
      print("You're not logged in");
    }
  }

  void fetchStore() async {
    try {
      final response = await dashboardProvider.fetchStore();
      final List body = response.data['data'];

      if (response.statusCode == 200) {
        store.value = body.map((e) => Store.fromJson(e)).toList();
      } else {
        failedSnackbar('Failed', response.statusCode.toString());
      }
    } on DioError catch (e) {
      failedSnackbar('Failed', e.response!.data.toString());
    }

    isLoading.value = false;
    update();
  }
}
