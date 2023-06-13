import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:member_apps/app/component/base_text_input.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/gratis_ongkir/controller.dart';

class GratisOngkirPage extends StatelessWidget {
  const GratisOngkirPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return LoadingAnimationWidget.flickr(
                      leftDotColor: baseColor,
                      rightDotColor: yellow,
                      size: 80,
                    );
                  },
                );
              },
              child: const Text('Show Loading'),
            ),
          ),
        ),
      ),
    );
  }
}
