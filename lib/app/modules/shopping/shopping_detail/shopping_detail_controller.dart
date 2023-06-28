import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:member_apps/app/core/utils/snackbar.dart';
import 'package:member_apps/app/data/models/shopping_detail.dart';
import 'package:member_apps/app/data/providers/shopping_provider.dart';

class ShoppingDetailController extends GetxController {
  final ShoppingProvider shoppingProvider;

  ShoppingDetailController({required this.shoppingProvider});

  var isLoading = true.obs;
  var reloadOther = false.obs;
  var shoppingDetail = <ShoppingDetail>[].obs;
  final docnum = ''.obs;
  final jumlah = 0.obs;
  final total = ''.obs;

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
    if (docnum.value.isNotEmpty) {
      reloadOther.value = true;

      try {
        final response =
            await shoppingProvider.fetchShoppingDetail(docnum.value);
        final List<ShoppingDetail> body = response.data['data'] == null
            ? []
            : listShoppingDetailFromJson(jsonEncode(response.data['data']));

        shoppingDetail.value = body;
        update();
      } on DioError catch (e) {
        failedSnackbar('Failed', e.response.toString());
      } finally {
        isLoading.value = false;
        reloadOther.value = false;
      }

      final subTotal =
          shoppingDetail.map((element) => element.subTotal).toList();
      jumlah.value = subTotal.fold(
          0, (sum, element) => sum + int.parse(element.toString()));

      total.value = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp ',
      ).format(jumlah.value);

      print(total.value);

      update();
    }
  }
}
