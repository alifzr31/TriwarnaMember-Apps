import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_apps/app/animation/fadeanimation.dart';
import 'package:member_apps/app/core/value.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_to_act/slide_to_act.dart';

// class OnBoardPage extends StatelessWidget {
//   const OnBoardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: OnboardingPagePresenter(
//         pages: [
//           OnboardingPageModel(
//             title: 'Fast, Fluid and Secure',
//             description:
//                 'Enjoy the best of the world in the palm of your hands.',
//             imageUrl: 'https://i.ibb.co/cJqsPSB/scooter.png',
//             bgColor: Colors.white,
//           ),
//           OnboardingPageModel(
//             title: 'Connect with your friends.',
//             description: 'Connect with your friends anytime anywhere.',
//             imageUrl: 'https://i.ibb.co/LvmZypG/storefront-illustration-2.png',
//             bgColor: const Color(0xff1eb090),
//           ),
//           OnboardingPageModel(
//             title: 'Bookmark your favourites',
//             description:
//                 'Bookmark your favourite quotes to read at a leisure time.',
//             imageUrl: 'https://i.ibb.co/420D7VP/building.png',
//             bgColor: const Color(0xfffeae4f),
//           ),
//           OnboardingPageModel(
//             title: 'Follow creators',
//             description: 'Follow your favourite creators to stay in the loop.',
//             imageUrl: 'https://i.ibb.co/cJqsPSB/scooter.png',
//             bgColor: Colors.purple,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class OnboardingPagePresenter extends StatefulWidget {
//   final List<OnboardingPageModel> pages;
//   final VoidCallback? onSkip;
//   final VoidCallback? onFinish;

//   const OnboardingPagePresenter(
//       {Key? key, required this.pages, this.onSkip, this.onFinish})
//       : super(key: key);

//   @override
//   State<OnboardingPagePresenter> createState() => _OnboardingPageState();
// }

// class _OnboardingPageState extends State<OnboardingPagePresenter> {
//   // Store the currently visible page
//   int _currentPage = 0;
//   // Define a controller for the pageview
//   final PageController _pageController = PageController(initialPage: 0);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedContainer(
//         duration: const Duration(milliseconds: 250),
//         color: widget.pages[_currentPage].bgColor,
//         child: SafeArea(
//           child: Column(
//             children: [
//               Expanded(
//                 // Pageview to render each page
//                 child: PageView.builder(
//                   controller: _pageController,
//                   itemCount: widget.pages.length,
//                   onPageChanged: (idx) {
//                     // Change current page when pageview changes
//                     setState(() {
//                       _currentPage = idx;
//                     });
//                   },
//                   itemBuilder: (context, idx) {
//                     final item = widget.pages[idx];
//                     return Column(
//                       children: [
//                         Expanded(
//                           flex: 3,
//                           child: Padding(
//                             padding: const EdgeInsets.all(32.0),
//                             child: Image.network(
//                               item.imageUrl,
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                             flex: 1,
//                             child: Column(children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Text(item.title,
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .headline6
//                                         ?.copyWith(
//                                           fontWeight: FontWeight.bold,
//                                           color: item.textColor,
//                                         )),
//                               ),
//                               Container(
//                                 constraints:
//                                     const BoxConstraints(maxWidth: 280),
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 24.0, vertical: 8.0),
//                                 child: Text(item.description,
//                                     textAlign: TextAlign.center,
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyText2
//                                         ?.copyWith(
//                                           color: item.textColor,
//                                         )),
//                               )
//                             ]))
//                       ],
//                     );
//                   },
//                 ),
//               ),

//               // Current page indicator
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: widget.pages
//                     .map((item) => AnimatedContainer(
//                           duration: const Duration(milliseconds: 250),
//                           width: _currentPage == widget.pages.indexOf(item)
//                               ? 30
//                               : 8,
//                           height: 8,
//                           margin: const EdgeInsets.all(2.0),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10.0)),
//                         ))
//                     .toList(),
//               ),

//               // Bottom buttons
//               SizedBox(
//                 height: 100,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextButton(
//                       style: TextButton.styleFrom(
//                           visualDensity: VisualDensity.comfortable,
//                           foregroundColor: Colors.white,
//                           textStyle: const TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold)),
//                       onPressed: () {
//                         _pageController.animateToPage(
//                           _currentPage + 3,
//                           curve: Curves.easeInOutCubic,
//                           duration: const Duration(milliseconds: 500),
//                         );
//                       },
//                       child: Text(
//                         _currentPage == widget.pages.length - 1 ? "" : "Skip",
//                       ),
//                     ),
//                     TextButton(
//                       style: TextButton.styleFrom(
//                         visualDensity: VisualDensity.comfortable,
//                         foregroundColor: Colors.white,
//                         textStyle: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       onPressed: () {
//                         if (_currentPage == widget.pages.length - 1) {
//                           widget.onFinish?.call();
//                           Get.offAndToNamed('/login');
//                         } else {
//                           _pageController.animateToPage(
//                             _currentPage + 1,
//                             curve: Curves.easeInOutCubic,
//                             duration: const Duration(milliseconds: 250),
//                           );
//                         }
//                       },
//                       child: Row(
//                         children: [
//                           Text(
//                             _currentPage == widget.pages.length - 1
//                                 ? "Finish"
//                                 : "Next",
//                           ),
//                           const SizedBox(width: 8),
//                           Icon(_currentPage == widget.pages.length - 1
//                               ? Icons.done
//                               : Icons.arrow_forward),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class OnboardingPageModel {
//   final String title;
//   final String description;
//   final String imageUrl;
//   final Color? bgColor;
//   final Color textColor;

//   OnboardingPageModel(
//       {required this.title,
//       required this.description,
//       required this.imageUrl,
//       this.bgColor,
//       this.textColor = Colors.white});
// }

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  final PageController _pageController = PageController(initialPage: 0);

  List Images = [
    'onboard1.png',
    'onboard2.png',
    'onboard3.png',
  ];

  List title = ['One Stop', '', ''];

  List subtitle = ['Painting & Decorating Solution', '', ''];

  List desc = [
    'We provide all the points to enhance your walls',
    'Paint your walls with the best quality paint',
    'We provide the best quality for your paint needs.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: Images.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Column(
                children: [
                  if (index == 1) SizedBox(height: 180),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeAnimation(
                                delay: 1,
                                child: Text(
                                  title[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                              FadeAnimation(
                                delay: 1,
                                child: Text(
                                  subtitle[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: List.generate(
                            3,
                            (indexDots) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                width: 5,
                                height: index == indexDots ? 18 : 6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: index == indexDots
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height / 100 * 7),
                  index == 2
                      ? SizedBox(height: Get.height * 0.54)
                      : index == 0
                          ? FadeAnimation(
                              delay: 1,
                              child: Column(
                                children: [
                                  const SizedBox(height: 60),
                                  Image.asset('assets/images/' + Images[index]),
                                ],
                              ),
                            )
                          : FadeAnimation(
                              delay: 1,
                              child:
                                  Image.asset('assets/images/' + Images[index]),
                            ),
                  const SizedBox(height: 40),
                  FadeAnimation(
                    delay: 1,
                    child: Text(
                      desc[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: Get.height / 100 * 4),
                  if (index == 2)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Builder(
                        builder: (context) {
                          final GlobalKey<SlideActionState> key = GlobalKey();

                          return FadeAnimation(
                            delay: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: SlideAction(
                                key: key,
                                sliderRotate: false,
                                text: 'Get Started',
                                textStyle: const TextStyle(
                                  color: baseColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                onSubmit: () async {
                                  await Future.delayed(
                                    const Duration(seconds: 1),
                                    () async {
                                      await key.currentState!.reset();
                                      Get.offAllNamed('/dashboard0');
                                    },
                                  );
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setBool('opened', true);
                                },
                                innerColor: baseColor,
                                outerColor: Colors.white,
                                sliderButtonIconSize: 20,
                                height: 60,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
              if (index == 1)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: FadeAnimation(
                    delay: 1,
                    child: Image.asset(
                      'assets/images/headonboard2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              if (index == 2)
                Positioned(
                  top: 130,
                  right: -30,
                  child: FadeAnimation(
                    delay: 1,
                    child: Image.asset('assets/images/onboard3.png'),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
