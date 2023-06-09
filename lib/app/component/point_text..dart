import 'package:flutter/material.dart';
import 'package:member_apps/app/core/value.dart';

class PointText extends StatelessWidget {
  const PointText({
    Key? key,
    required this.text,
    this.size,
    this.bold,
    this.letterSpacing,
    this.textAlign,
  }) : super(key: key);

  final String text;
  final double? size;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final FontWeight? bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: yellow,
        fontSize: size,
        fontWeight: bold,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
