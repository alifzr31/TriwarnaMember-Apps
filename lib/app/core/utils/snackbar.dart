import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void successSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    margin: const EdgeInsets.all(10),
    icon: const Icon(
      Icons.check,
      color: Colors.white,
      size: 30,
    ),
    backgroundColor: Colors.green.withOpacity(0.8),
    colorText: Colors.white,
  );
}

void failedSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    margin: const EdgeInsets.all(10),
    icon: const Icon(
      CupertinoIcons.xmark,
      color: Colors.white,
      size: 30,
    ),
    backgroundColor: Colors.red.withOpacity(0.8),
    colorText: Colors.white,
  );
}

void infoSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    margin: const EdgeInsets.all(10),
    icon: const Icon(
      Icons.info,
      color: Colors.white,
      size: 30,
    ),
    backgroundColor: Colors.blue.withOpacity(0.8),
    colorText: Colors.white,
  );
}
