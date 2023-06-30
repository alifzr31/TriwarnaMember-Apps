import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            top: -30,
            right: -45,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: baseColor.withOpacity(0.5),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
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

  final controller = Get.find<AuthController>();

  final List<String> _idType = [
    'KTP',
    'SIM',
  ];

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
                      label: 'Full Name',
                      controller: controller.fullNameController,
                    ),
                    const SizedBox(height: 20),
                    BaseTextInput(
                      label: 'Email',
                      controller: controller.emailRegisController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    BaseTextInput(
                      label: 'Username',
                      controller: controller.usernameController,
                    ),
                    const SizedBox(height: 20),
                    BaseTextInput(
                      label: 'Password',
                      controller: controller.passwordRegisController,
                      obscureText: showPass,
                      keyboardType: TextInputType.visiblePassword,
                      icon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPass = !showPass;
                          });
                        },
                        icon: Icon(
                            showPass ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                    const SizedBox(height: 20),
                    BaseDropdown(
                      items: _idType
                          .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) {
                        controller.idTypeController.text = value as String;
                      },
                      hint: 'ID Type',
                    ),
                    const SizedBox(height: 20),
                    BaseTextInput(
                      label: 'ID Number',
                      controller: controller.idNumberController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    BaseTextInput(
                      label: 'Contact',
                      controller: controller.contactController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            width: Get.width,
            child: BaseButton(
              text: 'Register',
              onPressed: () {
                controller.register(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? '),
                GestureDetector(
                  onTap: () {
                    Get.offAndToNamed('/login');
                  },
                  child: const Text(
                    'Log In here',
                    style: TextStyle(color: baseColor),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
