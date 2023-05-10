import 'package:flutter/material.dart';
import 'package:member_apps/app/core/value.dart';

class PointText extends StatelessWidget {
  const PointText({
    Key? key,
    required this.text,
    this.size,
    this.bold,
  }) : super(key: key);

  final String text;
  final double? size;
  final FontWeight? bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: yellow, fontSize: size, fontWeight: bold),
    );
  }
}
