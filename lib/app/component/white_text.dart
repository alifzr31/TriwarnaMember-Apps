import 'package:flutter/material.dart';

class WhiteText extends StatelessWidget {
  const WhiteText({
    Key? key,
    required this.text,
    this.size,
    this.textAlign,
    this.bold,
  }) : super(key: key);

  final String text;
  final double? size;
  final TextAlign? textAlign;
  final FontWeight? bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(color: Colors.white, fontSize: size, fontWeight: bold),
    );
  }
}
