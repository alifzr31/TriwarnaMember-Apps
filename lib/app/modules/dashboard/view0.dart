import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/widget/home.dart';
import 'package:member_apps/app/modules/dashboard/widget/store.dart';

class DashboardPage0 extends StatefulWidget {
  const DashboardPage0({super.key});

  @override
  State<DashboardPage0> createState() => _DashboardPage0State();
}

class _DashboardPage0State extends State<DashboardPage0> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _page,
        children: [
          HomePage(),
          StorePage(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomNavigationBar(
          currentIndex: _page,
          elevation: 30,
          scaleCurve: Curves.bounceIn,
          borderRadius: const Radius.circular(20),
          unSelectedColor: Colors.grey,
          strokeColor: Colors.grey,
          backgroundColor: Colors.white,
          selectedColor: baseColor,
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          items: [
            CustomNavigationBarItem(
              icon: const Icon(HeroIcons.home),
              title: const Text('Home'),
            ),
            CustomNavigationBarItem(
              icon: const Icon(HeroIcons.map_pin),
              title: const Text('Store'),
            ),
          ],
          bubbleCurve: Curves.bounceInOut,
        ),
      ),
    );
  }
}
