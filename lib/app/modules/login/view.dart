import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/component/yellow_button.dart';
import 'package:member_apps/app/component/base_text_input.dart';
import 'package:member_apps/app/core/value.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height * 0.12),
            child: Image.asset(
              'assets/images/login.png',
              height: 80,
            ),
          ),
          const BaseTextInput(
            label: 'Email',
            icon: Icon(HeroIcons.user),
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
          const Divider(),
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
              onPressed: () {},
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
