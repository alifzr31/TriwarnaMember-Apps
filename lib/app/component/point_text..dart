import 'package:flutter/material.dart';

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
      style: TextStyle(color: Color.fromARGB(255, 255, 189, 0), fontSize: size, fontWeight: bold),
    );
  }
}
