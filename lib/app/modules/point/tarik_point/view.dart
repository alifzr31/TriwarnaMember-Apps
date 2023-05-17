import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_button.dart';
import 'package:member_apps/app/component/base_dropdown.dart';
import 'package:member_apps/app/component/transparent_appbar.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';

class TarikPointPage extends StatefulWidget {
  const TarikPointPage({super.key});

  @override
  State<TarikPointPage> createState() => _TarikPointPageState();
}

class _TarikPointPageState extends State<TarikPointPage> {
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppbar(
        title: 'REDEEM POINT',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeAnimation(
              delay: 1,
              child: const Text(
                '*The number of Coins cannot be less than 50',
                style: TextStyle(color: Colors.red),
              ),
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
    return Expanded(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeAnimation(
              delay: 1.5,
              child: BaseDropdown(
                hint: 'Nominal Point',
                items: _items.map((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(),
                onChanged: (val) {},
              ),
            ),
            SizedBox(
              height: 40,
              width: Get.width,
              child: BaseButton(
                text: 'Pull Point',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
