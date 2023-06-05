import 'package:flutter/material.dart';
import 'package:member_apps/app/component/transparent_appbar.dart';

class ViewReceipt extends StatelessWidget {
  const ViewReceipt({
    Key? key,
    required this.title,
    this.image,
    this.signature,
  }) : super(key: key);

  final String title;
  final String? image;
  final String? signature;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppbar(
        title: title,
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Center(
          child: Image.network(
        image == null ? signature.toString() : image.toString(),
        fit: BoxFit.cover,
      )),
    );
  }
}
