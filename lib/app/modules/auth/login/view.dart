import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/component/yellow_button.dart';
import 'package:member_apps/app/component/base_text_input.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/auth/controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Stack(
            children: [
              Positioned(
                right: -300,
                bottom: -30,
                child: Image.asset('assets/images/wave.png', fit: BoxFit.cover),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: LoginForm(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool showPass = true;
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height * 0.12),
            child: Image.asset(
              'assets/images/login.png',
              height: 80,
            ),
          ),
          BaseTextInput(
            controller: controller.emailController,
            label: 'Username or Email Address',
            icon: Icon(HeroIcons.user),
          ),
          const SizedBox(height: 20),
          BaseTextInput(
            controller: controller.passwordController,
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
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerRight,
            child: Text('Forgot Password?'),
          ),
          SizedBox(height: Get.height * 0.14),
          SizedBox(
            width: Get.width,
            height: 40,
            child: YellowButton(
              text: 'Log In',
              onPressed: () async {
                if (controller.formKey.currentState!.validate()) {
                  controller.login();
                  print(controller.emailController.text);
                  print(controller.passwordController.text);
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed('/register');
                },
                child: const Text(
                  'Register here',
                  style: TextStyle(color: yellow),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}