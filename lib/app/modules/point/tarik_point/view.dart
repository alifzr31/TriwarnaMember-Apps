import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/component/base_button.dart';
import 'package:member_apps/app/component/base_dropdown.dart';
import 'package:member_apps/app/component/base_text_input.dart';
import 'package:member_apps/app/component/transparent_appbar.dart';

class TarikPointPage extends StatelessWidget {
  const TarikPointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppbar(
        title: 'PULL POINT',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '*The number of Coins cannot be less than 50',
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 10),
            FormTarik(),
          ],
        ),
      ),
    );
  }
}

class FormTarik extends StatelessWidget {
  FormTarik({super.key});
  final formKey = GlobalKey<FormState>();

  final List<String> _items = [
    'Option 1',
    'Option 2',
    'Option 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          BaseDropdown(
            label: 'Nominal Point',
            items: _items.map((e) {
              return DropdownMenuItem(value: e, child: Text(e));
            }).toList(),
            onChanged: (val) {},
          ),
          SizedBox(height: Get.height * 0.1),
          SizedBox(
            width: Get.width,
            child: BaseButton(
              text: 'Pull Point',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
