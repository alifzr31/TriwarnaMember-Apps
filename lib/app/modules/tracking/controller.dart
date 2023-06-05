import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/data/models/tracking.dart';
import 'package:member_apps/app/data/providers/tracking_provider.dart';

class TrackingController extends GetxController {
  final TrackingProvider trackingProvider;

  TrackingController({required this.trackingProvider});

  var isLoading = true.obs;
  var tracking = <Tracking>[].obs;
  final serialVoucher = ''.obs;
  final image = ''.obs;
  final signature = ''.obs;
  var res;

  @override
  void onInit() {
    fetchTracking();
    super.onInit();
  }

  @override
  void onReady() {
    fetchTracking();
    super.onReady();
  }

  @override
  void onClose() {
    tracking.clear();
    super.onClose();
  }

  void fetchTracking() async {
    try {
      final response =
          await trackingProvider.fetchTracking(serialVoucher.value);
      final List<Tracking> body = response.data['data'] == null
          ? []
          : listTrackingFromJson(jsonEncode(response.data['data']));

      if (response.data['receipt'] == null) {
        image.value = '';
        signature.value = '';
      } else {
        image.value = response.data['receipt']['image'];
        signature.value = response.data['receipt']['signature'];
      }

      tracking.value = body;

      isLoading.value = false;
      update();
    } on DioError catch (e) {
      print(e);
    }
  }
}
