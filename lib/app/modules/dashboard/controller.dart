import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  var isLoading = false.obs;
  var user = Rx<User?>(null);
  var store = <Store>[].obs;
  var lottery = <Lottery>[].obs;
  final token = ''.obs;

  int page = 1;
  final int limit = 15;
  var hasMore = true.obs;
  final ScrollController scrollController = ScrollController();
  var firstLoading = true.obs;

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token_access = sharedPreferences.getString('token');
    token.value = token_access.toString();

    if (token.value != 'null') {
      fetchProfile();
      fetchLottery();

      scrollController.addListener(() {
        if (scrollController.position.maxScrollExtent ==
                scrollController.offset &&
            hasMore.value) {
          fetchLottery();
        }
      });
    }

    fetchStore();

    super.onInit();
  }

  @override
  void onReady() {
    if (token.value != 'null') {
      fetchProfile();
      fetchLottery();

      scrollController.addListener(() {
        if (scrollController.position.maxScrollExtent ==
                scrollController.offset &&
            hasMore.value) {
          fetchLottery();
        }
      });
    }

    fetchStore();

    super.onReady();
  }

  @override
  void onClose() {
    store.clear();
    lottery.clear();
    scrollController.dispose();
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
      failedSnackbar('Failed', e.response.toString());
    }

    isLoading.value = false;
    update();
  }

  Future<void> fetchLottery() async {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
      final response = await dashboardProvider.fetchLottery(page, limit);
      final List<Lottery> body = response.data['data']['data'] == null
          ? []
          : listLotteryFromJson(jsonEncode(response.data['data']['data']));

      if (response.statusCode == 200) {
        page++;

        if (body.length < limit) {
          hasMore.value = false;
        }

        lottery.addAll(body);

        update();
      }
    } on DioError catch (e) {
      failedSnackbar('Failed Fetching Lottery', e.response.toString());
    } finally {
      isLoading.value = false;
      firstLoading.value = false;
    }

    update();
  }

  Future<void> refreshLottery() async {
    await Future.delayed(const Duration(milliseconds: 2500), () async {
      isLoading.value = false;
      hasMore.value = true;
      page = 1;
      lottery.clear();

      await fetchLottery();

      await Fluttertoast.showToast(
        msg: 'Lottery Data Refreshed',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.8),
        textColor: Colors.white,
        fontSize: 12.0,
      );
    });
  }
}
