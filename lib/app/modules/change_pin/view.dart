import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_button.dart';
import 'package:member_apps/app/component/base_pin_input.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/change_pin/controller.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';

class ChangePinPage extends StatelessWidget {
  const ChangePinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change PIN'),
        centerTitle: true,
        backgroundColor: baseColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FormChangePin(),
        ),
      ),
    );
  }
}

class FormChangePin extends StatefulWidget {
  const FormChangePin({super.key});

  @override
  State<FormChangePin> createState() => FormChangePinState();
}

class FormChangePinState extends State<FormChangePin> {
  final focusNodeCurrent = FocusNode();
  final focusNodeNew = FocusNode();
  final focusNodeConfirm = FocusNode();

  final controller = Get.find<ChangePinController>();
  final userController = Get.find<DashboardController>();

  var visible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => userController.user.value == null
              ? Container()
              : Expanded(
                child: SingleChildScrollView(
                  child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Your Current PIN',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: BasePinInput(
                              controller: controller.currentPinController,
                              focusNode: focusNodeCurrent,
                              validator: (value) {
                                return value == null || value.isEmpty
                                    ? 'Please input your Current PIN'
                                    : value.length < 6
                                        ? "PIN is incorrect"
                                        : null;
                              },
                              onCompleted: (value) {
                                if (value != userController.user.value!.pin) {
                                  setState(() {
                                    visible.value = true;
                                  });
                                } else {
                                  setState(() {
                                    visible.value = false;
                                  });
                                }
                
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            visible: visible.value,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Invalid Current PIN',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 176, 0, 32),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Your New PIN',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: BasePinInput(
                              controller: controller.newPinController,
                              focusNode: focusNodeNew,
                              validator: (value) {
                                return value == null || value.isEmpty
                                    ? 'Please input your New PIN'
                                    : value.length < 6
                                        ? 'PIN is incorrect'
                                        : value ==
                                                controller.currentPinController.text
                                            ? "New PIN can't same with Current PIN"
                                            : null;
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Confirm Your New PIN',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: BasePinInput(
                              controller: controller.confirmPinController,
                              focusNode: focusNodeConfirm,
                              validator: (value) {
                                return value == null || value.isEmpty
                                    ? 'Please confirm your New PIN'
                                    : value.length < 6
                                        ? 'PIN is incorrect'
                                        : value != controller.newPinController.text
                                            ? "Confirm PIN doesn't match with New PIN"
                                            : null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
              ),
        ),
        SizedBox(
          width: Get.width,
          height: 40,
          child: BaseButton(
            text: 'Change Pin',
            onPressed: () {
              focusNodeCurrent.unfocus();
              focusNodeNew.unfocus();
              focusNodeConfirm.unfocus();

              if (controller.formKey.currentState!.validate()) {
                controller.changePin(context);
              }
            },
          ),
        ),
      ],
    );
  }
}
