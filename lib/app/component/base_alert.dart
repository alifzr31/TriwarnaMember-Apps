import 'package:flutter/material.dart';

class BaseAlert extends StatelessWidget {
  const BaseAlert({
    Key? key,
    required this.title,
    required this.content,
    this.height,
  }) : super(key: key);

  final String title;
  final Widget content;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.only(bottom: 0, top: 20, right: 10, left: 10),
      contentPadding: const EdgeInsets.only(bottom: 20, top: 0, right: 10, left: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: Center(child: Text(title)),
      content: SizedBox(
        height: height,
        child: content
      ),
    );
  }
}
