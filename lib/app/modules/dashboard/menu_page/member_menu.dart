import 'package:flutter/material.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/core/value.dart';

class MemberMenuPage extends StatelessWidget {
  const MemberMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeAnimation(
                    delay: 1,
                    child: Row(
                      children: [
                        Image.asset('assets/images/splash.png', width: 50),
                        const SizedBox(width: 10),
                        const Text(
                          'Member In Triwarna',
                          style: TextStyle(
                            fontSize: 22,
                            color: baseColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              FadeAnimation(
                delay: 1.3,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'We provide interesting benefits for members',
                    style: TextStyle(
                      color: baseColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const MemberMenuBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class MemberMenuBody extends StatelessWidget {
  const MemberMenuBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            FadeAnimation(
              delay: 1,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/silver.png',
                    width: 50,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Member Silver Benefit',
                      style: TextStyle(
                        fontSize: 22,
                        color: baseColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            FadeAnimation(
              delay: 1.3,
              child: Row(
                children: const [
                  Icon(Icons.check, color: yellow),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Free enrollment fee.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            FadeAnimation(
              delay: 1.3,
              child: Row(
                children: const [
                  Icon(Icons.check, color: yellow),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Easy registration requirements.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            FadeAnimation(
              delay: 1.3,
              child: Row(
                children: const [
                  Icon(Icons.check, color: yellow),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Customers are entitled to earn 1 point for every purchase of Rp.100,000 for all triwarna products by using a triwarna silver member.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            FadeAnimation(
              delay: 1.3,
              child: Row(
                children: const [
                  Icon(Icons.check, color: yellow),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Points can be redeemed for direct prizes with a minimum redemption of 150 points.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            FadeAnimation(
              delay: 1.3,
              child: Row(
                children: const [
                  Icon(Icons.check, color: yellow),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Points cannot be cashed out.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            FadeAnimation(
              delay: 1,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/gold.png',
                    width: 50,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Member Gold Benefit',
                      style: TextStyle(
                        fontSize: 22,
                        color: baseColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            FadeAnimation(
              delay: 1.3,
              child: Row(
                children: const [
                  Icon(Icons.check, color: yellow),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Free enrollment fee.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            FadeAnimation(
              delay: 1.3,
              child: Row(
                children: const [
                  Icon(Icons.check, color: yellow),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Easy registration requirements.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            FadeAnimation(
              delay: 1.3,
              child: Row(
                children: const [
                  Icon(Icons.check, color: yellow),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Gold members can be obtained after the total customer transactions using digital members reach a minimum of Rp. 10,000,000.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            FadeAnimation(
              delay: 1.3,
              child: Row(
                children: const [
                  Icon(Icons.check, color: yellow),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Customers are entitled to get 2 points for every purchase of Rp.100,000 for all triwarna products by using the Triwarna Gold Member.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            FadeAnimation(
              delay: 1.3,
              child: Row(
                children: const [
                  Icon(Icons.check, color: yellow),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Points can be redeemed for direct prizes with a minimum redemption of 150 points.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            FadeAnimation(
              delay: 1.3,
              child: Row(
                children: const [
                  Icon(Icons.check, color: yellow),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Points cannot be cashed out.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            FadeAnimation(
              delay: 1,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/platinum.png',
                    width: 50,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Member Platinum Benefit',
                      style: TextStyle(
                        fontSize: 22,
                        color: baseColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            FadeAnimation(
              delay: 1.3,
              child: Row(
                children: const [
                  Icon(Icons.check, color: yellow),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Free enrollment fee.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            FadeAnimation(
              delay: 1.3,
              child: Row(
                children: const [
                  Icon(Icons.check, color: yellow),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Easy registration requirements.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            FadeAnimation(
              delay: 1.3,
              child: Row(
                children: const [
                  Icon(Icons.check, color: yellow),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Gold members can be obtained after the total customer transactions using digital members reach a minimum of Rp. 100,000,000.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            FadeAnimation(
              delay: 1.3,
              child: Row(
                children: const [
                  Icon(Icons.check, color: yellow),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Customers are entitled to get 3 points for every purchase of Rp.100,000 for all triwarna products by using the Triwarna Paltinum Member.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            FadeAnimation(
              delay: 1.3,
              child: Row(
                children: const [
                  Icon(Icons.check, color: yellow),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Points can be redeemed for direct prizes with a minimum redemption of 150 points.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            FadeAnimation(
              delay: 1.3,
              child: Row(
                children: const [
                  Icon(Icons.check, color: yellow),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Points cannot be cashed out.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
