import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/core/utils/snackbar.dart';
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
        failedSnackbar(
          'Failed',
          response.statusCode.toString() +
              ' ' +
              response.statusMessage.toString(),
        );
      }
    } on DioError catch (e) {
      failedSnackbar(
        'Failed',
        e.response.toString(),
      );
    }

    isLoading.value = false;
    update();
  }
}
