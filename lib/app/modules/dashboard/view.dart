import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:member_apps/app/modules/dashboard/widget/account.dart';
import 'package:member_apps/app/modules/dashboard/widget/lottery.dart';
import 'package:member_apps/app/modules/dashboard/widget/home.dart';
import 'package:member_apps/app/modules/dashboard/widget/store.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _page,
        children: [
          HomePage(),
          LotteryPage(),
          StorePage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _page,
        scaleCurve: Curves.bounceIn,
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
            icon: const Icon(HeroIcons.gift),
            title: const Text('Lottery'),
          ),
          CustomNavigationBarItem(
            icon: const Icon(HeroIcons.map_pin),
            title: const Text('Store'),
          ),
          CustomNavigationBarItem(
            icon: const Icon(HeroIcons.user),
            title: const Text('Account'),
          ),
        ],
        bubbleCurve: Curves.bounceInOut,
      ),
    );
  }
}
