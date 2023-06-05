import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/component/base_text_input.dart';
import 'package:member_apps/app/modules/gratis_ongkir/controller.dart';

class GratisOngkirPage extends StatelessWidget {
  const GratisOngkirPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text('GRATIS ONGKIR PAGE'),
          ),
        ),
      ),
    );
  }
}

