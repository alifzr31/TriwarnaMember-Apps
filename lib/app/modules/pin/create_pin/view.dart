import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_button.dart';
import 'package:member_apps/app/component/base_pin_input.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/pin/create_pin/controller.dart';

class CreatePinPage extends StatelessWidget {
  const CreatePinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat PIN Baru'),
        centerTitle: true,
        backgroundColor: baseColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: FormCreatePin(),
    );
  }
}

class FormCreatePin extends StatelessWidget {
  FormCreatePin({super.key});
  final controller = Get.find<CreatePinController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'PIN Baru Anda',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: BasePinInput(
                        controller: controller.newPinController,
                        validator: (value) {
                          return value == null || value.isEmpty
                              ? 'Masukkan PIN baru anda'
                              : value.length < 6
                                  ? 'PIN is incorrect'
                                  : null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Konfirmasi PIN Baru Anda',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    FadeAnimation(
                      delay: 1,
                      child: BasePinInput(
                        controller: controller.confirmPinController,
                        validator: (value) {
                          return value == null || value.isEmpty
                              ? 'Masukkan konfirmasi PIN baru anda'
                              : value.length < 6
                                  ? 'PIN is incorrect'
                                  : value != controller.newPinController.text
                                      ? 'PIN tidak sama'
                                      : null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: Get.width,
            height: 40,
            child: BaseButton(
              text: 'Buat PIN',
              onPressed: () {
                if (controller.formKey.currentState!.validate()) {
                  controller.createPin(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
