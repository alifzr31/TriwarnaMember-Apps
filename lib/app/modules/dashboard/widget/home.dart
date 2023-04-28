import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/component/card_menu.dart';
import 'package:member_apps/app/core/value.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Header(),
              const Divider(),
              const MenuButton(),
              SizedBox(
                height: 200,
                width: Get.width,
                child: CarouselField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          Container(
            height: 100,
            width: Get.width,
            decoration: const BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/login');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: yellow,
                            foregroundColor: baseColor,
                            shape: const StadiumBorder(),
                          ),
                          child: const Text('Login'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 30,
                        width: 85,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/register');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: yellow,
                            foregroundColor: baseColor,
                            shape: const StadiumBorder(),
                          ),
                          child: const Text('Register'),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Please login first for detail information',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 25,
            width: Get.width,
            decoration: BoxDecoration(
              color: yellow,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 6,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                CardMenu(
                  pathImage: 'assets/images/event.png',
                  onTap: () {},
                ),
                CardMenu(
                  pathImage: 'assets/images/konsul.png',
                  onTap: () {},
                ),
              ],
            ),
            Column(
              children: [
                CardMenu(
                  pathImage: 'assets/images/promo.png',
                  onTap: () {},
                ),
                CardMenu(
                  pathImage: 'assets/images/ongkir.png',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
        CardMenu(
          pathImage: 'assets/images/member.png',
          onTap: () {},
        ),
      ],
    );
  }
}

class CarouselField extends StatelessWidget {
  CarouselField({super.key});

  List<Widget> cards = [
    Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.black.withOpacity(0.5),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/back-splash.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: cards.length,
      pagination: const SwiperPagination(),
      curve: Curves.bounceOut,
      itemBuilder: (context, index) {
        return cards[index];
      },
    );
  }
}
