import 'package:flutter/material.dart';

class GreyText extends StatelessWidget {
  const GreyText({
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
      style: TextStyle(color: Colors.grey, fontSize: size, fontWeight: bold),
    );
  }
}
