import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:member_apps/app/component/base_button.dart';
import 'package:member_apps/app/component/base_dropdown.dart';
import 'package:member_apps/app/component/base_text_input.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/auth/controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 100,
            left: -80,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: baseColor.withOpacity(0.5),
            ),
          ),
          Positioned(
            top: -40,
            right: -50,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: baseColor.withOpacity(0.5),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/splash.png', width: 50),
                      const SizedBox(width: 10),
                      const Text(
                        'Form Registration',
                        style: TextStyle(fontSize: 22, color: baseColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                      'Please input your data for make member card and get all benefit for you.'),
                  const SizedBox(height: 10),
                  const RegisterForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool showPass = true;

  final List<String> _items = [
    'KTP',
    'SIM',
  ];

  final controller = Get.find<AuthController>();
  late final XFile? imagePicked;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKeyRegister,
                child: Column(
                  children: [
                    BaseTextInput(
                      controller: controller.nameController,
                      label: 'Full Name',
                      validator: (val) {
                        if (controller.nameController.text.isEmpty ||
                            controller.nameController.text == null) {
                          return 'Input your name';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const BaseTextInput(
                      label: 'Email',
                    ),
                    const SizedBox(height: 20),
                    // BaseDropdown(
                    //   label: 'ID Type',
                    //   items: _items.map((e) {
                    //     return DropdownMenuItem(
                    //       value: e,
                    //       child: Text(e),
                    //     );
                    //   }).toList(),
                    //   onChanged: (val) {},
                    // ),
                    const SizedBox(height: 20),
                    const BaseTextInput(
                      label: 'ID Number',
                    ),
                    const SizedBox(height: 20),
                    const BaseTextInput(
                      label: 'Contact',
                    ),
                    const SizedBox(height: 20),
                    BaseTextInput(
                      label: 'Password',
                      obscureText: showPass,
                      icon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPass = !showPass;
                          });
                        },
                        icon: showPass
                            ? const Icon(HeroIcons.eye)
                            : const Icon(HeroIcons.eye_slash),
                      ),
                    ),
                    BaseButton(
                      text: 'text',
                      onPressed: () async {
                        final ImagePicker _picker = ImagePicker();
                        imagePicked = await _picker.pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 80,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          SizedBox(
            height: 40,
            width: Get.width,
            child: BaseButton(
              onPressed: () async {
                if (controller.formKeyRegister.currentState!.validate()) {
                  print('Submitted');
                  controller.register(imagePicked!);
                } else {
                  print('Complete your input please');
                }
              },
              text: 'Register',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              TextButton(
                onPressed: () {
                  Get.offAndToNamed('/login');
                },
                child: const Text('Log In here'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
