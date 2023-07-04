import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/component/base_text_input.dart';
import 'package:member_apps/app/component/yellow_button.dart';
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
                bottom: Get.height < 811
                    ? Get.width < 390
                        ? -150
                        : -30
                    : 0,
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
      key: controller.formKeyLogin,
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
            icon: const Icon(HeroIcons.user),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Masukkan username atau email anda';
              }

              return null;
            },
          ),
          const SizedBox(height: 20),
          BaseTextInput(
            controller: controller.passwordController,
            label: 'Password',
            obscureText: showPass,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Masukkan password anda';
              }

              return null;
            },
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
          SizedBox(
              height: Get.height < 811
                  ? Get.width < 390
                      ? Get.height * 0.08
                      : Get.height * 0.14
                  : Get.height * 0.16),
          SizedBox(
            width: Get.width,
            height: 40,
            child: YellowButton(
              text: 'Log In',
              onPressed: () async {
                if (controller.formKeyLogin.currentState!.validate()) {
                  controller.login(context);
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
                  Get.offAndToNamed('/register');
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
