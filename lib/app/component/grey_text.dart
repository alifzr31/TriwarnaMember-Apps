import 'package:flutter/material.dart';

class GreyText extends StatelessWidget {
  const GreyText({
    Key? key,
    required this.text,
    this.size,
    this.bold,
    this.textAlign,
  }) : super(key: key);

  final String text;
  final double? size;
  final FontWeight? bold;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(color: Colors.grey, fontSize: size, fontWeight: bold),
    );
  }
}
