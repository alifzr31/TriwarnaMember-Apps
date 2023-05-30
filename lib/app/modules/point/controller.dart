import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/data/models/point.dart';
import 'package:member_apps/app/data/providers/point_provider.dart';

class PointController extends GetxController {
  final PointProvider pointProvider;

  PointController({required this.pointProvider});

  var isLoading = true.obs;
  var point = <Point>[].obs;
  var jumlah = ''.obs;
  var last_transaction = ''.obs;

  @override
  void onInit() {
    fetchPoint();
    super.onInit();
  }

  @override
  void onReady() {
    fetchPoint();
    super.onReady();
  }

  @override
  void onClose() {
    point.clear();
    super.onClose();
  }

  void fetchPoint() async {
    try {
      final response = await pointProvider.fetchPoint();
      final List<Point> body = response.data['point_history'] == null
          ? []
          : listPointFromJson(jsonEncode(
              response.data['point_history'],
            ));
      if (response.statusCode == 200) {
        jumlah.value = response.data['point']['last_point'];
        last_transaction.value = response.data['last_transaction'];
        point.value = body;

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
        e.response.toString(),
        backgroundColor: Colors.red.shade800,
        colorText: Colors.white,
      );
    }

    isLoading.value = false;
    update();
  }
}
