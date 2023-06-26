import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/core/utils/snackbar.dart';
import 'package:member_apps/app/data/models/lottery.dart';
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
  var lottery = <Lottery>[].obs;
  final token = ''.obs;

  var page = 1;
  final limit = 10;
  var hasMore = true.obs;

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token_access = sharedPreferences.getString('token');
    token.value = token_access.toString();

    if (token.value != 'null') {
      fetchProfile();
      fetchLottery();
    }

    fetchStore();

    super.onInit();
  }

  @override
  void onReady() {
    if (token.value != 'null') {
      fetchProfile();
      fetchLottery();
    }

    fetchStore();

    super.onReady();
  }

  @override
  void onClose() {
    store.clear();
    lottery.clear();
    // user.close();
    // store.close();
    super.onClose();
  }

  void fetchProfile() async {
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
      failedSnackbar('Failed Fetching Profile', e.response!.data.toString());
    }

    isLoading.value = false;
    update();
  }

  void fetchStore() async {
    try {
      final response = await dashboardProvider.fetchStore();
      final List body = response.data['data'];

      if (response.statusCode == 200) {
        store.value = body.map((e) => Store.fromJson(e)).toList();
      } else {
        failedSnackbar('Failed Fetching Store', response.statusCode.toString());
      }
    } on DioError catch (e) {
      failedSnackbar('Failed', e.response!.data.toString());
    }

    isLoading.value = false;
    update();
  }

  void fetchLottery() async {
    try {
      final response = await dashboardProvider.fetchLottery();
      final List<Lottery> body = response.data['data'] == null
          ? []
          : listLotteryFromJson(jsonEncode(response.data['data']));
      print(response.data['data']);

      lottery.value = body;
      update();
    } on DioError catch (e) {
      failedSnackbar('Failed Fetching Lottery', e.response.toString());
    } finally {
      isLoading.value = false;
    }

    update();
  }
}
