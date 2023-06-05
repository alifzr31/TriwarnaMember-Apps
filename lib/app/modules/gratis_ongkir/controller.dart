import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/data/providers/gratis_ongkir_provider.dart';

class GratisOngkirController extends GetxController {
  final GratisOngkirProvider gratisOngkirProvider;

  GratisOngkirController({required this.gratisOngkirProvider});

  var isLoading = true.obs;
  final search = ''.obs;

  
}
