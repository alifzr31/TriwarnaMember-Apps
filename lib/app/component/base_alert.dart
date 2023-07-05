import 'package:flutter/material.dart';

class BaseAlert extends StatelessWidget {
  const BaseAlert({
    Key? key,
    this.title,
    required this.content,
    this.height,
    this.gradient,
  }) : super(key: key);

  final Widget? title;
  final Widget content;
  final double? height;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: title,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: gradient,
        ),
        height: height,
        child: content
      ),
    );
  }
}
