import 'package:get/get.dart';
import 'package:member_apps/app/modules/dashboard/view.dart';
import 'package:member_apps/app/modules/login/view.dart';
import 'package:member_apps/app/modules/onboard/view.dart';
import 'package:member_apps/app/modules/point/view.dart';
import 'package:member_apps/app/modules/profile/view.dart';
import 'package:member_apps/app/modules/register/view.dart';
import 'package:member_apps/app/modules/splash/view.dart';
import 'package:member_apps/app/routes/routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplasScreen(),
      transition: Transition.size
    ),
    GetPage(
      name: Routes.onboard,
      page: () => const OnBoardPage(),
      transition: Transition.zoom
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      transition: Transition.rightToLeftWithFade
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: Routes.point,
      page: () => const PointPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfilePage(),
      transition: Transition.fadeIn,
    ),
  ];
}
