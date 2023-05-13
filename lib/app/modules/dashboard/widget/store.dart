import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/component/base_refresh.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/controller.dart';
import 'package:url_launcher/url_launcher.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeAnimation(
              delay: 1,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'Take a look our store',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: baseColor),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListStore(),
          ],
        ),
      ),
    );
  }
}

class ListStore extends StatelessWidget {
  ListStore({super.key});

  final controller = Get.find<DashboardController>();

  Future<void> refreshListStore() async {
    await Future.delayed(
      const Duration(milliseconds: 2500),
      () async {
        controller.fetchStore();
        controller.store.refresh();

        await Fluttertoast.showToast(
          msg: 'Store Data Refreshed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.8),
          textColor: Colors.white,
          fontSize: 12.0,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? Center(
              child: SpinKitWave(
                size: 30,
                itemBuilder: (BuildContext context, int index) {
                  return const DecoratedBox(
                    decoration: BoxDecoration(
                      color: baseColor,
                    ),
                  );
                },
              ),
            )
          : Expanded(
              child: BaseRefresh(
                onRefresh: refreshListStore,
                child: ListView.builder(
                  itemCount: controller.store.length,
                  itemBuilder: (context, index) {
                    var store = controller.store[index];

                    return FadeAnimation(
                      delay: 1,
                      child: Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/store_icon.svg'),
                              const SizedBox(width: 15),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      store.storeName!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: baseColor,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      store.address!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: baseColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              CircleAvatar(
                                backgroundColor: baseColor,
                                radius: 22,
                                child: IconButton(
                                  onPressed: () async {
                                    final url = Uri.parse('tel:${store.phone}');
                                    await launchUrl(url);
                                  },
                                  icon: const Icon(Icons.phone, color: yellow),
                                ),
                              ),
                              const SizedBox(width: 5),
                              CircleAvatar(
                                backgroundColor: baseColor,
                                radius: 22,
                                child: IconButton(
                                  onPressed: () async {
                                    final lat = double.parse(store.lat!);
                                    final long = double.parse(store.long!);

                                    MapsLauncher.launchCoordinates(
                                      lat,
                                      long,
                                      store.storeName,
                                    );
                                  },
                                  icon: const Icon(Icons.map, color: yellow),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
