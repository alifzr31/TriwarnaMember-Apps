import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/core/value.dart';

class TransparentAppbar extends StatelessWidget with PreferredSizeWidget {
  const TransparentAppbar({
    Key? key,
    required this.title,
    required this.preferredSize,
    this.action,
  }) : super(key: key);

  final String title;
  final Size preferredSize;
  final List<Widget>? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(color: baseColor),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back_ios_new, color: baseColor),
      ),
      actions: action,
    );
  }
}