import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/core/utils/snackbar.dart';
import 'package:member_apps/app/data/models/shopping_detail.dart';
import 'package:member_apps/app/data/providers/shopping_provider.dart';

class ShoppingDetailController extends GetxController {
  final ShoppingProvider shoppingProvider;

  ShoppingDetailController({required this.shoppingProvider});

  var isLoading = true.obs;
  var shoppingDetail = <ShoppingDetail>[].obs;
  final docnum = ''.obs;
  final fetchTotal = 0.obs;

  @override
  void onInit() {
    fetchShoppingDetail();
    super.onInit();
  }

  @override
  void onReady() {
    fetchShoppingDetail();
    super.onReady();
  }

  @override
  void onClose() {
    shoppingDetail.clear();
    super.onClose();
  }

  void fetchShoppingDetail() async {
    try {
      final response = await shoppingProvider.fetchShoppingDetail(docnum.value);
      final List<ShoppingDetail> body = response.data['data'] == null
          ? []
          : listShoppingDetailFromJson(jsonEncode(response.data['data']));

      shoppingDetail.value = body;
      fetchTotal.value = response.data['total'] == null ? 0 : response.data['total'];
      print(fetchTotal.value);

      update();
    } on DioError catch (e) {
      failedSnackbar('Failed', e.response.toString());
    }

    isLoading.value = false;
    update();
  }
}
