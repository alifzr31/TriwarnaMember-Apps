import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/component/base_button.dart';
import 'package:member_apps/app/component/base_text_input.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/change_pass/controller.dart';

class ChangePassPage extends StatelessWidget {
  const ChangePassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        centerTitle: true,
        backgroundColor: baseColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FormChangePass(),
      ),
    );
  }
}

class FormChangePass extends StatefulWidget {
  const FormChangePass({super.key});

  @override
  State<FormChangePass> createState() => _FormChangePassState();
}

class _FormChangePassState extends State<FormChangePass> {
  final controller = Get.find<ChangePassController>();
  bool showCurrentPass = true;
  bool showNewPass = true;
  bool showConfirmPass = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Form(
          key: controller.formKey,
          child: Column(
            children: [
              BaseTextInput(
                controller: controller.currentPassController,
                label: 'Current Password',
                obscureText: showCurrentPass,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'Please input your current password';
                  }

                  return null;
                },
                icon: IconButton(
                  onPressed: () {
                    setState(() {
                      showCurrentPass = !showCurrentPass;
                    });
                  },
                  icon: showCurrentPass
                      ? const Icon(Iconsax.eye)
                      : const Icon(Iconsax.eye_slash),
                ),
              ),
              const SizedBox(height: 20),
              BaseTextInput(
                controller: controller.newPassController,
                label: 'New Password',
                obscureText: showNewPass,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'Please input your new password';
                  } else {
                    if (value == controller.currentPassController.text) {
                      return 'Please use different password';
                    } else {
                      if (value.length < 8) {
                        return 'New password must be at least 8 characters';
                      }
                    }
                  }

                  return null;
                },
                icon: IconButton(
                  onPressed: () {
                    setState(() {
                      showNewPass = !showNewPass;
                    });
                  },
                  icon: showNewPass
                      ? const Icon(Iconsax.eye)
                      : const Icon(Iconsax.eye_slash),
                ),
              ),
              const SizedBox(height: 20),
              BaseTextInput(
                controller: controller.confirmPassController,
                label: 'Confirm Password',
                obscureText: showConfirmPass,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'Please input your confirm password';
                  } else {
                    if (value.length < 8) {
                      return 'New password must be at least 8 characters';
                    } else {
                      if (value != controller.newPassController.text) {
                        return "Password is does'nt match";
                      }
                    }
                  }

                  return null;
                },
                icon: IconButton(
                  onPressed: () {
                    setState(() {
                      showConfirmPass = !showConfirmPass;
                    });
                  },
                  icon: showConfirmPass
                      ? const Icon(Iconsax.eye)
                      : const Icon(Iconsax.eye_slash),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
          width: Get.width,
          child: BaseButton(
            onPressed: () async {
              if (controller.formKey.currentState!.validate()) {
                controller.changePass();
              }
            },
            text: 'Change Password',
          ),
        ),
      ],
    );
  }
}
