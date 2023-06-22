import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:member_apps/app/core/utils/snackbar.dart';
import 'package:member_apps/app/data/models/voucher.dart';
import 'package:member_apps/app/data/providers/voucher_provider.dart';

class VoucherController extends GetxController {
  final VoucherProvider voucherProvider;

  VoucherController({required this.voucherProvider});

  var isLoading = true.obs;
  var voucher = <Voucher>[].obs;

  @override
  void onInit() {
    fetchVoucher();
    super.onInit();
  }

  @override
  void onReady() {
    fetchVoucher();
    super.onReady();
  }

  @override
  void onClose() {
    voucher.clear();
    super.onClose();
  }

  void fetchVoucher() async {
    try {
      final response = await voucherProvider.fetchVoucher();
      final List<Voucher> body = response.data['data'] == null
          ? []
          : listVoucherFromJson(jsonEncode(response.data['data']));

      if (response.statusCode == 200) {
        voucher.value = body;
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
      failedSnackbar('Failed', e.response.toString());
    }

    isLoading.value = false;
    update();
  }
}
