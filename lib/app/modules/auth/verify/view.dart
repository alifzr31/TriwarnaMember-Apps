import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/component/base_button.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/auth/controller.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:url_launcher/url_launcher.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

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
          Positioned(
            left: 0,
            right: 0,
            bottom: Get.width < 390 ? -80 : -10,
            child: ClipPath(
              clipper: WaveClipperOne(flip: true, reverse: true),
              child: SizedBox(
                height: 200,
                child: Material(
                  color: yellow,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: Get.width < 390 ? -90 : -20,
            child: ClipPath(
              clipper: WaveClipperTwo(reverse: true),
              child: SizedBox(
                height: 200,
                child: Material(
                  color: baseColor,
                ),
              ),
            ),
          ),
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.1),
                    child: Image.asset(
                      'assets/images/login.png',
                      height: 80,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.085),
                  VerifyBody(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VerifyBody extends StatefulWidget {
  const VerifyBody({super.key});

  @override
  State<VerifyBody> createState() => _VerifyBodyState();
}

class _VerifyBodyState extends State<VerifyBody> {
  final String email = Get.arguments;
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(
          () => Column(
            children: [
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                    text: 'Akun anda sudah berhasil dibuat dengan email\n',
                    style: const TextStyle(fontSize: 18),
                    children: [
                      TextSpan(
                        text: email,
                        style: const TextStyle(color: baseColor),
                      ),
                    ]),
              ),
              const SizedBox(height: 10),
              controller.hasSent.value
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      height: 80,
                      width: Get.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade200,
                          foregroundColor: yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          var result = await OpenMailApp.openMailApp();

                          if (!result.didOpen && !result.canOpen) {
                            final url = Uri.parse('https://mail.google.com/');
                            await launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                              webViewConfiguration: WebViewConfiguration(
                                enableDomStorage: true,
                                enableJavaScript: true,
                              ),
                            );
                          } else if (!result.didOpen && result.canOpen) {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return MailAppPickerDialog(
                                  mailApps: result.options,
                                );
                              },
                            );
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 2,
                              child: const Text.rich(
                                softWrap: false,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                TextSpan(
                                  text: 'Buka ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Gmail ',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    TextSpan(
                                      text: 'Sekarang',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                              child: SvgPicture.asset('assets/images/gmail.svg',
                                  height: 20),
                            ),
                          ],
                        ),
                      ),
                    )
                  : AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      height: 80,
                      width:
                          controller.isLoading.value == true ? 80 : Get.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: baseColor,
                          foregroundColor: yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          controller.email.value = email;
                          controller.verifyEmail();
                        },
                        child: controller.isLoading.value == true
                            ? SpinKitWave(
                                size: 20,
                                itemBuilder: (BuildContext context, int index) {
                                  return const DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: yellow,
                                    ),
                                  );
                                },
                              )
                            : const Text(
                                'Verifikasi Akun',
                                softWrap: true,
                                overflow: TextOverflow.fade,
                                style: TextStyle(fontSize: 16),
                              ),
                      ),
                    ),
              Visibility(
                visible: !controller.hasSent.value,
                child: const Text(
                  '*Silahkan verifikasi akun anda terlebih dahulu\nuntuk dapat menikmati berbagai fitur menarik didalamnya',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Visibility(
                visible: controller.hasSent.value,
                child: const Text(
                  'Link aktivasi sudah terkirim ke email anda. Mohon untuk segera melakukan aktivasi akun melalui link yang sudah dikirim.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
