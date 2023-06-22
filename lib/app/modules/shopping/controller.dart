import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/core/utils/snackbar.dart';
import 'package:member_apps/app/data/models/shopping.dart';
import 'package:member_apps/app/data/models/shopping_detail.dart';
import 'package:member_apps/app/data/providers/shopping_provider.dart';

class ShoppingController extends GetxController {
  final ShoppingProvider shoppingProvider;

  ShoppingController({required this.shoppingProvider});

  var isLoading = true.obs;
  var shopping = <Shopping>[].obs;

  @override
  void onInit() {
    fetchShopping();
    super.onInit();
  }

  @override
  void onReady() {
    fetchShopping();
    super.onReady();
  }

  @override
  void onClose() {
    shopping.clear();
    super.onClose();
  }

  void fetchShopping() async {
    try {
      final response = await shoppingProvider.fetchShopping();
      final List<Shopping> body = response.data['data'] == null
          ? []
          : listShoppingFromJson(jsonEncode(response.data['data']));

      shopping.value = body;
      update();
    } on DioError catch (e) {
      failedSnackbar('Failed', e.response.toString());
    }

    isLoading.value = false;
    update();
  }
}
