import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/data/models/prize.dart';
import 'package:member_apps/app/data/providers/prize_provider.dart';

class PrizeController extends GetxController {
  final PrizeProvider prizeProvider;

  PrizeController({required this.prizeProvider});

  var isLoading = true.obs;
  var prize = <Prize>[].obs;
  final searchPrize = ''.obs;

  @override
  void onInit() {
    fetchPrize();
    super.onInit();
  }

  @override
  void onReady() {
    fetchPrize();
    super.onReady();
  }

  @override
  void onClose() {
    prize.clear();
    super.onClose();
  }

  void fetchPrize() async {
    try {
      final response = await prizeProvider.fetchPrize();
      final List<Prize> body = response.data['data'] == null
          ? []
          : listPrizeFromJson(jsonEncode(response.data['data']));

      if (response.statusCode == 200) {
        prize.value = body;

        update();
      } else {
        Get.snackbar(
          'Failed',
          response.statusCode.toString() +
              ' ' +
              response.statusMessage.toString(),
          backgroundColor: Colors.red.shade800,
          colorText: Colors.white,
        );
      }
    } on DioError catch (e) {
      Get.snackbar(
        'Failed',
        e.response!.statusCode.toString() +
            ' ' +
            e.response!.statusMessage.toString(),
        backgroundColor: Colors.red.shade800,
        colorText: Colors.white,
      );
    }

    isLoading.value = false;
    update();
  }
}
