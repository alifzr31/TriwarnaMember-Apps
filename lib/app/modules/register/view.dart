import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/component/base_button.dart';
import 'package:member_apps/app/component/base_dropdown.dart';
import 'package:member_apps/app/component/base_text_input.dart';
import 'package:member_apps/app/core/value.dart';

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
            child: SingleChildScrollView(
              child: Container(
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
                    const Divider(height: 20),
                    const Text(
                        'Please input your data for make member card and get all benefit for you.'),
                    const Divider(),
                    const RegisterForm(),
                  ],
                ),
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

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const BaseTextInput(
            label: 'Full Name',
          ),
          const Divider(),
          const BaseTextInput(
            label: 'Email',
          ),
          const Divider(),
          BaseDropdown(
            label: 'ID Type',
            items: _items.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (val) {},
          ),
          const Divider(),
          const BaseTextInput(
            label: 'ID Number',
          ),
          const Divider(),
          const BaseTextInput(
            label: 'Contact',
          ),
          const Divider(),
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
          SizedBox(height: Get.height * 0.11),
          SizedBox(
            height: 40,
            width: Get.width,
            child: BaseButton(
              onPressed: () {},
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
